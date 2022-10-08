import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonErrorMessage extends StatelessWidget {
  const CommonErrorMessage({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                message,
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
