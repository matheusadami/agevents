import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonFilterEvents extends StatelessWidget {
  const ButtonFilterEvents({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.filter,
                color: AppColors.dark,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'Filtros',
                style: AppTextStyles.verySmallDarkSemiBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
