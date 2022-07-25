import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class BarItem {
  Widget view;
  String text;
  IconData iconData;

  BarItem({required this.text, required this.iconData, required this.view});
}

class AnimatedBottomBar extends StatefulWidget {
  final int currentPage;
  final List<BarItem> barItems;
  final Duration animationDuration;
  final void Function(int currentPage) onChangeCurrentPage;

  const AnimatedBottomBar({
    Key? key,
    required this.currentPage,
    required this.barItems,
    required this.animationDuration,
    required this.onChangeCurrentPage,
  }) : super(key: key);

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  List<Widget> buildBarItems() {
    return List.generate(
      widget.barItems.length,
      (i) {
        var item = widget.barItems[i];
        bool isSelected = widget.currentPage == i;

        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            widget.onChangeCurrentPage(i);
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: [
                Icon(
                  item.iconData,
                  color: isSelected ? Colors.white : AppColors.gray,
                  size: 16,
                ),
                const SizedBox(width: 10.0),
                AnimatedSize(
                  duration: widget.animationDuration,
                  curve: Curves.easeInOut,
                  child: Text(
                    isSelected ? item.text : '',
                    style: AppTextStyles.verySmallWhiteSemiBold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      growable: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildBarItems(),
      ),
    );
  }
}
