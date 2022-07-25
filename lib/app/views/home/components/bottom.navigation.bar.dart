import 'package:agevents/app/views/home/components/animated.bottom.bar.dart';
import 'package:flutter/material.dart';

class MenuNavigationBar extends StatefulWidget {
  final int currentPage;
  final List<BarItem> barItems;
  final void Function(int index) onChangeCurrentPage;

  const MenuNavigationBar({
    Key? key,
    required this.barItems,
    required this.currentPage,
    required this.onChangeCurrentPage,
  }) : super(key: key);

  @override
  State<MenuNavigationBar> createState() => _MenuNavigationBarState();
}

class _MenuNavigationBarState extends State<MenuNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomBar(
      currentPage: widget.currentPage,
      barItems: widget.barItems,
      animationDuration: const Duration(milliseconds: 150),
      onChangeCurrentPage: widget.onChangeCurrentPage,
    );
  }
}
