import 'package:agevents/app/views/events/create/event.create.view.dart';
import 'package:agevents/app/views/home/home.view.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/dependency.injection.widget.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return DependencyInjectionWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AgEvents',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ).copyWith(
            primary: AppColors.primary,
            tertiary: AppColors.tertiary,
            secondary: AppColors.secondary,
          ),
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomeView(),
          '/createEvent': (context) => const EventCreateView(),
        },
      ),
    );
  }
}
