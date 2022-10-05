import 'package:agevents/app/views/events/create/event.create.view.dart';
import 'package:agevents/app/views/events/update/event.update.view.dart';
import 'package:agevents/app/views/forgot-password/forgot.password.view.dart';
import 'package:agevents/app/views/home/home.view.dart';
import 'package:agevents/app/views/signin/signin.view.dart';
import 'package:agevents/app/views/signup/signup.view.dart';
import 'package:agevents/core/providers/dependency.injection.provider.dart';
import 'package:agevents/core/providers/graphql.client.provider.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return DependencyInjectionProvider(
      child: GraphQLClientProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
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
          initialRoute: '/signin',
          routes: {
            '/signin': (context) => const SignInView(),
            '/signup': (context) => const SignUpView(),
            '/forgot-password': (context) => const ForgotPasswordView(),
            '/home': (context) => const HomeView(),
            '/create-event': (context) => const EventCreateView(),
            '/update-event': (context) => const EventUpdateView(),
          },
        ),
      ),
    );
  }
}
