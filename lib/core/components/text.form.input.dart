import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String? helperText;
  final String? hintText;
  final Color? fillColor;
  final bool autofocus;
  final IconData? icon;
  final bool isTextArea;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;

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
    this.fillColor,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.smallDarkSemiBold,
      onTap: onTap,
      minLines: isTextArea ? 5 : 1,
      maxLines: isTextArea ? 5 : 1,
      textAlign: textAlign,
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hintText,
        fillColor: fillColor ?? AppColors.gray.withOpacity(0.3),
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
