import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class ButtonSignInGoogle extends StatelessWidget {
  const ButtonSignInGoogle({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(25);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: borderRadius,
        border: Border.all(color: AppColors.gray),
      ),
      child: Material(
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset('lib/assets/google.ico'),
                ),
                SizedBox(width: size.width * 0.08),
                Text(
                  'Entrar com Google',
                  style: AppTextStyles.smallDarkSemiBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
