import 'package:agevents/app/views/board/components/badge.dart' as badge;
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphicSectionModel {
  final EventType eventType;
  final int qtdeEvents;
  final int qtdePercentageEvents;

  GraphicSectionModel.createSection({
    required this.eventType,
    required this.qtdeEvents,
    required this.qtdePercentageEvents,
  });

  double get percentage => qtdePercentageEvents * 100 / qtdeEvents;

  bool get isShow => percentage > 0.0;
}

class GraphicModel {
  final int touchedSection;
  final List<GraphicSectionModel> graphicSectionModels;

  GraphicModel({
    this.touchedSection = -1,
    required this.graphicSectionModels,
  });

  bool get isEmptySections {
    final percentages = graphicSectionModels.map((e) => e.percentage).toList();
    if (percentages.isNotEmpty) return percentages.reduce((c, n) => c + n) <= 0;
    return true;
  }

  GraphicModel copyWith({int? touchedSection}) {
    return GraphicModel(
      touchedSection: touchedSection ?? this.touchedSection,
      graphicSectionModels: graphicSectionModels,
    );
  }

  void pushSection({
    required EventType eventType,
    required int qtdeEvents,
    required int qtdePercentageEvents,
  }) {
    final graphicSection = GraphicSectionModel.createSection(
      eventType: eventType,
      qtdeEvents: qtdeEvents,
      qtdePercentageEvents: qtdePercentageEvents,
    );

    if (graphicSection.isShow) graphicSectionModels.add(graphicSection);
  }

  List<PieChartSectionData> buildSections() {
    return graphicSectionModels.mapIndexed<PieChartSectionData>(
      (i, section) {
        final isTouched = i == touchedSection;
        final radius = isTouched ? 110.0 : 100.0;
        final fontSize = isTouched ? 20.0 : 16.0;
        final badgeSize = isTouched ? 55.0 : 40.0;

        return PieChartSectionData(
          color: section.eventType.color,
          value: section.percentage,
          title: '${section.percentage.round()}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          badgeWidget: badge.Badge(
            size: badgeSize,
            eventType: section.eventType,
          ),
          badgePositionPercentageOffset: .98,
        );
      },
    ).toList();
  }
}
