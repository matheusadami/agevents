import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class DividerSignIn extends StatelessWidget {
  const DividerSignIn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: const Divider(
            color: AppColors.gray,
            thickness: 2,
          ),
        ),
        Text('OU', style: AppTextStyles.smallGraySemiBold),
        SizedBox(
          width: size.width * 0.35,
          child: const Divider(
            color: AppColors.gray,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
