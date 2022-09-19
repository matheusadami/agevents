import 'package:agevents/core/providers/auth.user.provider.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
              context.read<AuthUserProvider>().currentUser.name,
              style: AppTextStyles.mediumDarkSemiBold,
            ),
            const SizedBox(height: 5),
            Text(
              context.read<AuthUserProvider>().currentUser.email,
              style: AppTextStyles.verySmallGraySemiBold,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    onPressed: () {},
                    child: const Icon(
                      FontAwesomeIcons.barsStaggered,
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
