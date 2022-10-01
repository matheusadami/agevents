import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EventsTodayNotFound extends StatelessWidget {
  const EventsTodayNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Lottie.asset(
            'lib/assets/animations/enjoy-beach-vacation.json',
            fit: BoxFit.fill,
          ),
        ),
        Text(
          'Você não possui eventos agendados.\nAproveite!',
          textAlign: TextAlign.center,
          style: AppTextStyles.smallDarkSemiBold,
        )
      ],
    );
  }
}
