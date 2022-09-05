import 'package:agevents/core/services/navigator.service.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';

class AlertsHelper {
  static showWarnSnackBar(String content, {BuildContext? context}) {
    final currentContext = context ?? NavigationService.context!;

    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        content: Text(content),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.orange,
      ),
    );
  }

  static showSuccessSnackBar(String content, {BuildContext? context}) {
    final currentContext = context ?? NavigationService.context!;

    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        content: Text(content),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.green,
      ),
    );
  }
}
