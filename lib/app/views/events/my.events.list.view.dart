import 'package:agevents/app/views/events/components/filter.events.dialog.dart';
import 'package:agevents/core/components/event.list.view.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyEventsListView extends StatelessWidget {
  const MyEventsListView({Key? key}) : super(key: key);

  void onPressedCreateEvent(BuildContext context) {
    Navigator.pushNamed(context, '/createEvent');
  }

  void onTapButtonFilter(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const FilterEventsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => onPressedCreateEvent(context),
        child: const Icon(
          FontAwesomeIcons.plus,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class ButtonFilterEvents extends StatelessWidget {
  const ButtonFilterEvents({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.filter,
                color: AppColors.dark,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'Filtros',
                style: AppTextStyles.verySmallDarkSemiBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
