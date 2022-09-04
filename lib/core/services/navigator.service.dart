import 'package:flutter/material.dart';

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get context => navigatorKey.currentContext;

  static dynamic pop() {
    return navigatorKey.currentState!.pop();
  }

  static Future<dynamic> navigateTo(String routeName, [Object? arguments]) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }
}
