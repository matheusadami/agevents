import 'package:agevents/app/blocs/events/my.events.bloc.dart';
import 'package:agevents/app/blocs/events/my.events.event.dart';
import 'package:agevents/app/blocs/events/my.events.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/views/events/components/button.filter.events.dart';
import 'package:agevents/app/views/events/components/button.remove.filters.events.dart';
import 'package:agevents/app/views/events/components/filter.events.dialog.dart';
import 'package:agevents/app/views/events/sheet/event.sheet.view.dart';
import 'package:agevents/core/components/common.error.message.dart';
import 'package:agevents/core/components/common.events.not.found.dart';
import 'package:agevents/core/components/common.loading.widget.dart';
import 'package:agevents/core/components/event.list.view.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyEventsListView extends StatefulWidget {
  const MyEventsListView({Key? key}) : super(key: key);

  @override
  State<MyEventsListView> createState() => _MyEventsListViewState();
}

class _MyEventsListViewState extends State<MyEventsListView> {
  void onPressedCreateEvent(BuildContext context) async {
    final currentContext = context.read<MyEventsBloc>();
    final isRefresh = await Navigator.pushNamed(
      context,
      '/create-event',
    ) as bool?;

    if (isRefresh ?? false) {
      currentContext.add(SearchMyEventsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyEventsBloc()..add(SearchMyEventsEvent()),
      child: BlocBuilder<MyEventsBloc, MyEventsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Meus Eventos',
                style: AppTextStyles.mediumDarkSemiBold,
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: (() {
              switch (state.runtimeType) {
                case LoadingMyEventsState:
                  return const CommonLoadingWidget();
                case LoadedMyEventsState:
                  return MyEventsViewBody(
                    state: (state as LoadedMyEventsState),
                    events: (state).events,
                    rootContext: context,
                  );
                case ExceptionMyEventsState:
                  return const ErrorMessageLoadingEvents();
              }
            }()),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () => onPressedCreateEvent(context),
              child: const Icon(
                FontAwesomeIcons.plus,
                color: AppColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ErrorMessageLoadingEvents extends StatelessWidget {
  const ErrorMessageLoadingEvents({Key? key}) : super(key: key);

  Future<void> onRefreshEvents(BuildContext context) async {
    final searchEvents = SearchMyEventsEvent(
      paramName: "",
      paramFinalDate: "",
      paramInitialDate: "",
    );

    context.read<MyEventsBloc>().add(searchEvents);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshEvents(context),
      child: const CommonErrorMessage(
        message: 'Não foi possível carregar seus eventos.',
      ),
    );
  }
}

class MyEventsViewBody extends StatelessWidget {
  const MyEventsViewBody({
    Key? key,
    required this.events,
    required this.state,
    required this.rootContext,
  }) : super(key: key);

  final List<EventModel> events;
  final LoadedMyEventsState state;
  final BuildContext rootContext;

  void onTapButtonFilter(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => FilterEventsDialog(rootContext: context),
    );
  }

  void onTapButtonRemoveFilters(BuildContext context) async {
    context.read<MyEventsBloc>().add(SearchMyEventsEvent());
  }

  void onTapEvent(EventModel eventModel, BuildContext context) async {
    final myEventsBloc = rootContext.read<MyEventsBloc>();

    final isRefresh = await showModalBottomSheet<bool?>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (_) => EventSheetView(eventModel: eventModel),
    );

    if (isRefresh ?? false) {
      // Loading the user's events
      final searchEvents = SearchMyEventsEvent(
        paramName: state.paramName,
        paramFinalDate: state.paramFinalDate,
        paramInitialDate: state.paramInitialDate,
      );

      myEventsBloc.add(searchEvents);
    }
  }

  Future<void> onRefreshEvents(BuildContext context) async {
    final searchEvents = SearchMyEventsEvent(
      paramName: state.paramName,
      paramFinalDate: state.paramFinalDate,
      paramInitialDate: state.paramInitialDate,
    );

    context.read<MyEventsBloc>().add(searchEvents);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => onRefreshEvents(context),
        strokeWidth: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              if (!state.isEmptyParams)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.buildLabelCurrentParams(),
                      style: AppTextStyles.verySmallDarkSemiBold,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(
                  top: state.isEmptyParams ? 16 : 0,
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonFilterEvents(onTap: () => onTapButtonFilter(context)),
                    if (!state.isEmptyParams)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ButtonRemoveFiltersEvents(
                          onTap: () => onTapButtonRemoveFilters(context),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: events.isNotEmpty
                      ? EventListView(
                          onTap: (eventModel) =>
                              onTapEvent(eventModel, context),
                          events: events,
                          isShowFavorite: false,
                        )
                      : const CommonEventsNotFound(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
