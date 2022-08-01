import 'package:agevents/core/components/event.list.view.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyEventsListView extends StatefulWidget {
  const MyEventsListView({Key? key}) : super(key: key);

  @override
  State<MyEventsListView> createState() => _MyEventsListViewState();
}

class _MyEventsListViewState extends State<MyEventsListView> {
  void onPressedCreateEvent() {
    Navigator.pushNamed(context, '/createEvent');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        onDateChanged: (value) => print(value),
        backButton: false,
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
        accent: Theme.of(context).colorScheme.primary,
        locale: 'pt-BR',
        events: List.generate(
          10,
          (index) => DateTime.now().subtract(
            Duration(days: index * 2),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Agenda',
                style: AppTextStyles.smallDarkSemiBold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            flex: 1,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: EventListView(isShowFavorite: false),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: onPressedCreateEvent,
        child: const Icon(
          FontAwesomeIcons.plus,
          color: AppColors.white,
        ),
      ),
    );
  }
}
