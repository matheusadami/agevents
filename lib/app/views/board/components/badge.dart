import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final double size;
  final EventType eventType;

  const Badge({
    Key? key,
    required this.size,
    required this.eventType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: eventType.color,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.dark.withOpacity(0.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * 0.15),
      child: Center(
        child: Icon(
          eventType.icon,
          color: eventType.color,
          size: size * 0.50,
        ),
      ),
    );
  }
}
