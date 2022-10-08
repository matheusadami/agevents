import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonEventsNotFound extends StatelessWidget {
  const CommonEventsNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Lottie.asset(
            'lib/assets/animations/shake-a-empty-box.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          'Nenhum evento foi encontrado',
          style: AppTextStyles.smallDarkSemiBold,
        )
      ],
    );
  }
}
