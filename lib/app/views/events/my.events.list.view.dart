import 'package:agevents/app/blocs/events/my.events.bloc.dart';
import 'package:agevents/app/blocs/events/my.events.event.dart';
import 'package:agevents/app/blocs/events/my.events.state.dart';
import 'package:agevents/app/models/event.model.dart';
import 'package:agevents/app/views/events/components/button.filter.events.dart';
import 'package:agevents/app/views/events/components/filter.events.dialog.dart';
import 'package:agevents/app/views/events/sheet/event.sheet.view.dart';
import 'package:agevents/core/components/event.list.view.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyEventsListView extends StatelessWidget {
  const MyEventsListView({Key? key}) : super(key: key);

  void onPressedCreateEvent(BuildContext context) {
    Navigator.pushNamed(context, '/create-event');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyEventsBloc>(
      create: (context) => MyEventsBloc()..add(SearchMyEventsEvent()),
      child: Scaffold(
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
        body: BlocBuilder<MyEventsBloc, MyEventsState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case LoadingMyEventsState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case LoadedMyEventsState:
                return MyEventsViewBody(
                  state: (state as LoadedMyEventsState),
                  events: (state).events,
                );
              case ExceptionMyEventsState:
                return Center(
                  child: Text((state as ExceptionMyEventsState).message),
                );
            }

            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () => onPressedCreateEvent(context),
          child: const Icon(
            FontAwesomeIcons.plus,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class MyEventsViewBody extends StatelessWidget {
  const MyEventsViewBody({
    Key? key,
    required this.events,
    required this.state,
  }) : super(key: key);

  final List<EventModel> events;
  final LoadedMyEventsState state;

  void onTapButtonFilter(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const FilterEventsDialog(),
    );
  }

  void onTapEvent(EventModel eventModel, BuildContext context) async {
    final myEventsBloc = context.read<MyEventsBloc>();

    await showModalBottomSheet<bool>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (_) => EventSheetView(eventModel: eventModel),
    );

    // Loading the user's events
    final searchEvents = SearchMyEventsEvent(
      paramName: state.paramName,
      paramFinalDate: state.paramFinalDate,
      paramInitialDate: state.paramInitialDate,
      paramEventType: state.paramEventType,
      paramEventPriority: state.paramEventPriority,
    );

    myEventsBloc.add(searchEvents);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonFilterEvents(onTap: () => onTapButtonFilter(context)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: EventListView(
                  onTap: (eventModel) => onTapEvent(eventModel, context),
                  events: events,
                  isShowFavorite: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
