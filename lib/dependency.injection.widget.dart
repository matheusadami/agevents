import 'package:agevents/app/blocs/board/board.bloc.dart';
import 'package:agevents/app/blocs/events/create/event.bloc.dart';
import 'package:agevents/app/blocs/graphic/graphic.bloc.dart';
import 'package:agevents/core/providers/navigation.bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DependencyInjectionWidget extends StatelessWidget {
  final Widget child;
  const DependencyInjectionWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(
          create: (context) => NavigationBarProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
