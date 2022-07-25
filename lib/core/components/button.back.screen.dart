import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonBackWidget extends StatelessWidget {
  final Color? color;
  const ButtonBackWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        FontAwesomeIcons.angleLeft,
        size: 24,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
