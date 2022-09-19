import 'package:agevents/app/views/board/board.view.dart';
import 'package:agevents/app/views/events/my.events.list.view.dart';
import 'package:agevents/app/views/feed/feed.view.dart';
import 'package:agevents/app/views/home/components/animated.bottom.bar.dart';
import 'package:agevents/app/views/home/components/bottom.navigation.bar.dart';
import 'package:agevents/app/views/profile/profile.view.dart';
import 'package:agevents/core/providers/navigation.bar.provider.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final NavigationBarProvider navigationBarProvider;
  final List<BarItem> barItems = [
    BarItem(
      view: const FeedView(),
      text: "Feed",
      iconData: FontAwesomeIcons.house,
    ),
    BarItem(
      view: const BoardView(),
      text: "Board",
      iconData: FontAwesomeIcons.chartPie,
    ),
    BarItem(
      view: const MyEventsListView(),
      text: "Meus Eventos",
      iconData: FontAwesomeIcons.barsStaggered,
    ),
    BarItem(
      view: const ProfileView(),
      text: "Perfil",
      iconData: FontAwesomeIcons.solidUser,
    ),
  ];

  @override
  void didChangeDependencies() {
    navigationBarProvider = context.read<NavigationBarProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.background,
      ),
      child: Selector<NavigationBarProvider, int>(
        selector: (context, provider) => provider.currentPage,
        builder: (context, currentPage, widget) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: barItems[currentPage].view,
          bottomNavigationBar: MenuNavigationBar(
            barItems: barItems,
            currentPage: currentPage,
            onChangeCurrentPage: navigationBarProvider.onChangeCurrentPage,
          ),
        ),
      ),
    );
  }
}
