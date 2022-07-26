import 'package:agevents/core/services/navigation.service.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';

class AlertsHelper {
  static showWarnSnackBar(
    String content, {
    BuildContext? context,
    bool isRemoveHorizontalMargin = false,
  }) {
    final currentContext = context ?? NavigationService.context!;

    EdgeInsetsGeometry? margin;
    if (isRemoveHorizontalMargin) {
      margin = const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0);
    }

    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        margin: margin,
        content: Text(content),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.orange,
      ),
    );
  }

  static showSuccessSnackBar(
    String content, {
    BuildContext? context,
    bool isRemoveHorizontalMargin = false,
  }) {
    final currentContext = context ?? NavigationService.context!;

    EdgeInsetsGeometry? margin;
    if (isRemoveHorizontalMargin) {
      margin = const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0);
    }

    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        margin: margin,
        content: Text(content),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.green,
      ),
    );
  }
}
