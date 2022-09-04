import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  final String label;
  final void Function() onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          label,
          style: AppTextStyles.smallWhiteSemiBold,
        ),
      ),
    );
  }
}
