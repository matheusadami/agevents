import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Telefone',
            style: AppTextStyles.verySmallGraySemiBold,
          ),
          Text(
            '(17) 992075281',
            style: AppTextStyles.smallDarkSemiBold,
          ),
          const SizedBox(height: 15),
          Text(
            'País',
            style: AppTextStyles.verySmallGraySemiBold,
          ),
          Text(
            'Brasil',
            style: AppTextStyles.smallDarkSemiBold,
          ),
          const SizedBox(height: 15),
          Text(
            'Profissão',
            style: AppTextStyles.verySmallGraySemiBold,
          ),
          Text(
            'Júnior Developer',
            style: AppTextStyles.smallDarkSemiBold,
          ),
        ],
      ),
    );
  }
}
