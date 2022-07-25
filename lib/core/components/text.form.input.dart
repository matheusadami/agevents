import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormInputWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? hintText;
  final Color fillColor;
  final bool autofocus;

  const TextFormInputWidget({
    Key? key,
    this.onTap,
    this.hintText,
    required this.fillColor,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.smallDarkSemiBold,
      onTap: onTap,
      autofocus: autofocus,
      decoration: InputDecoration(
        fillColor: fillColor,
        hintText: hintText,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
        ),
      ),
    );
  }
}
