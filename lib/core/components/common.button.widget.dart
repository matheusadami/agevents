import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.icon,
  }) : super(key: key);

  final String label;
  final void Function() onTap;
  final Color? backgroundColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 15),
            Text(
              label,
              style: AppTextStyles.smallWhiteSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
