import 'package:agevents/app/blocs/board/board.bloc.dart';
import 'package:agevents/app/blocs/events/create/event.bloc.dart';
import 'package:agevents/app/blocs/graphic/graphic.bloc.dart';
import 'package:agevents/app/blocs/signin/signin.bloc.dart';
import 'package:agevents/app/blocs/signup/signup.bloc.dart';
import 'package:agevents/app/repositories/forgot-password/forgot.password.repository.dart';
import 'package:agevents/app/repositories/forgot-password/interface.forgot.password.repository.dart';
import 'package:agevents/app/repositories/signin/interface.signin.repository.dart';
import 'package:agevents/app/repositories/signin/signin.repository.dart';
import 'package:agevents/app/repositories/signup/interface.signup.repository.dart';
import 'package:agevents/app/repositories/signup/signup.repository.dart';
import 'package:agevents/app/services/local.storage.service.dart';
import 'package:agevents/app/services/sms.service.dart';
import 'package:agevents/core/providers/navigation.bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DependencyInjectionWidget extends StatelessWidget {
  const DependencyInjectionWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(
          create: (context) => NavigationBarProvider(),
        ),
        Provider<SMSService>(
          create: (context) => SMSService(),
        ),
        Provider<LocalStorageService>(
          create: (context) => LocalStorageService(),
        ),
        Provider<ISignUpRepository>(
          create: (context) => SignUpRepository(),
        ),
        Provider<IForgotPasswordRepository>(
          create: (context) => FotgotPasswordRepository(),
        ),
        Provider<ISignInRepository>(
          create: (context) => SignInRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(),
          ),
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(),
          ),
          BlocProvider<BoardBloc>(
            create: (context) => BoardBloc(),
          ),
          BlocProvider<GraphicBloc>(
            create: (context) => GraphicBloc(),
          ),
          BlocProvider<EventBloc>(
            create: (context) => EventBloc(),
          ),
        ],
        child: child,
      ),
    );
  }
}
