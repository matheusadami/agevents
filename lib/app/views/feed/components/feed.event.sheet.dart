import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedEventSheet extends StatelessWidget {
  const FeedEventSheet({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: CommonButtonWidget(
        icon: const Icon(
          FontAwesomeIcons.solidCircleCheck,
          size: 24,
          color: AppColors.white,
        ),
        label: 'Finalizar Evento',
        onTap: onTap,
      ),
    );
  }
}
