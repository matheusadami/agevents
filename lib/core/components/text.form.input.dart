import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';

class TextFormInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String? helperText;
  final String? hintText;
  final Color fillColor;
  final bool autofocus;
  final IconData? icon;
  final bool isTextArea;

  const TextFormInputWidget({
    Key? key,
    this.icon,
    this.onTap,
    this.hintText,
    this.helperText,
    this.autofocus = false,
    this.isTextArea = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.smallDarkSemiBold,
      onTap: onTap,
      minLines: isTextArea ? 5 : 1,
      maxLines: isTextArea ? 5 : 1,
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hintText,
        fillColor: fillColor,
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
