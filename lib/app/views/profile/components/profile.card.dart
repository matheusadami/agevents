import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 8),
        child: Column(
          children: [
            Text(
              'Matheus Adami',
              style: AppTextStyles.mediumDarkSemiBold,
            ),
            const SizedBox(height: 5),
            Text(
              'example@gmail.com',
              style: AppTextStyles.verySmallGraySemiBold,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: AppColors.red,
                    onPressed: () {},
                    child: const Icon(
                      FontAwesomeIcons.solidHeart,
                      size: 24,
                      color: AppColors.white,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    child: const Icon(
                      FontAwesomeIcons.solidBell,
                      size: 24,
                      color: AppColors.white,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    onPressed: () {},
                    child: const Icon(
                      FontAwesomeIcons.phone,
                      size: 24,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
