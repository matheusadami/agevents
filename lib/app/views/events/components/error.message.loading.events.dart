import 'package:agevents/app/blocs/events/my.events.bloc.dart';
import 'package:agevents/app/blocs/events/my.events.event.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'lib/assets/animations/error.json',
                fit: BoxFit.fill,
              ),
              Text(
                'Não foi possível carregar seus eventos.',
                textAlign: TextAlign.center,
                style: AppTextStyles.smallDarkSemiBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
