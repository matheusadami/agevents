import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? helperText;
  final String? hintText;
  final Color? fillColor;
  final bool autofocus;
  final IconData? icon;
  final bool isTextArea;
  final bool isObscureText;
  final TextAlign textAlign;
  final String? initialValue;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;

  const TextFormInputWidget({
    Key? key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.helperText,
    this.hintText,
    this.fillColor,
    this.autofocus = false,
    this.icon,
    this.isTextArea = false,
    this.isObscureText = false,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.onTap,
    this.inputFormatters,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.smallDarkSemiBold,
      onTap: onTap,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      minLines: isTextArea ? 5 : 1,
      maxLines: isTextArea ? 5 : 1,
      textAlign: textAlign,
      autofocus: autofocus,
      controller: controller,
      obscureText: isObscureText,
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
