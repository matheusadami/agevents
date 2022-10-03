import 'package:agevents/app/blocs/feed/feed.bloc.dart';
import 'package:agevents/app/blocs/feed/feed.event.dart';
import 'package:agevents/app/blocs/feed/feed.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/views/feed/components/events.today.not.found.dart';
import 'package:agevents/core/components/event.list.view.dart';
import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/providers/navigation.bar.provider.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  late final NavigationBarProvider navigationBarProvider;

  void onTapSearchEvents() {
    navigationBarProvider.onChangeCurrentPage(1);
  }

  void onTapAllEvents() {
    navigationBarProvider.onChangeCurrentPage(2);
  }

  @override
  void didChangeDependencies() {
    navigationBarProvider = context.read<NavigationBarProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.read<AuthUserProvider>().firstUserName;

    return BlocProvider(
      create: (context) => FeedBloc()..add(LoadEventsTodayFeedEvent()),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              FontAwesomeIcons.house,
                              size: 20,
                              color: AppColors.white,
                            ),
                            Icon(
                              FontAwesomeIcons.solidBell,
                              size: 20,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'Olá, $userName 👋',
                                style: AppTextStyles.mediumWhiteSemiBold,
                                children: const [],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Eventos de hoje',
                              style: AppTextStyles.smallDarkSemiBold,
                            ),
                            TextButton(
                              onPressed: onTapAllEvents,
                              child: Text(
                                'Ver todos',
                                style: AppTextStyles.verySmallPrimaryBold,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<FeedBloc, FeedState>(
                          builder: (context, state) {
                            switch (state.runtimeType) {
                              case LoadingFeedState:
                                return const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              case LoadedFeedState:
                                return FeedBodyView(
                                  events: (state as LoadedFeedState).events,
                                );
                            }

                            return Container();
                          },
                        ),
                        //
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedBodyView extends StatelessWidget {
  const FeedBodyView({super.key, required this.events});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return events.isNotEmpty
        ? EventListView(onTap: (eventModel) {}, events: events)
        : const EventsTodayNotFound();
  }
}
