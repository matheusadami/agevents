import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLoadingWidget extends StatelessWidget {
  const CommonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Lottie.asset(
              'lib/assets/animations/loading.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'Carregando...',
            style: AppTextStyles.smallDarkSemiBold,
          )
        ],
      ),
    );
  }
}
