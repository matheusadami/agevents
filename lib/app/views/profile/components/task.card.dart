import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final int qtdeTasks;
  final bool isShowQtdeTasks;
  final void Function() onTap;

  const TaskCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
    this.qtdeTasks = 0,
    this.isShowQtdeTasks = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    icon,
                    size: 16,
                    color: iconColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  label,
                  style: AppTextStyles.smallPrimaryBold,
                ),
              ),
              Text(
                isShowQtdeTasks ? '$qtdeTasks Tasks' : '',
                style: AppTextStyles.verySmallGraySemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
