import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class BoardEventCard extends StatelessWidget {
  final int qtde;
  final String label;
  final IconData icon;
  final Color iconColor;

  const BoardEventCard({
    Key? key,
    required this.qtde,
    required this.label,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.gray.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      icon,
                      size: 16,
                      color: iconColor,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  label,
                  style: AppTextStyles.verySmallDarkSemiBold,
                ),
              ],
            ),
            Text(
              qtde.toString(),
              style: AppTextStyles.verySmallPrimaryBold,
            ),
          ],
        ),
      ),
    );
  }
}
