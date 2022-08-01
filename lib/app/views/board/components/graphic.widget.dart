import 'package:agevents/app/blocs/graphic/graphic.bloc.dart';
import 'package:agevents/app/blocs/graphic/graphic.event.dart';
import 'package:agevents/app/blocs/graphic/graphic.state.dart';
import 'package:agevents/app/models/graphic.model.dart';
import 'package:agevents/app/views/board/components/badge.dart';
import 'package:agevents/core/enums/event.type.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphicWidget extends StatelessWidget {
  final GraphicModel graphicModel;

  const GraphicWidget({Key? key, required this.graphicModel}) : super(key: key);

  void onTouchChart(
    FlTouchEvent event,
    PieTouchResponse? pieTouchResponse,
    BuildContext context,
    GraphicModel graphicModel,
  ) {
    int touchedSection = 0;
    if (!event.isInterestedForInteractions || pieTouchResponse == null) {
      touchedSection = -1;
    } else {
      touchedSection = pieTouchResponse.touchedSection!.touchedSectionIndex;
    }

    context.read<GraphicBloc>().add(
          ShowGraphicEvent(
            graphicModel.copyWith(
              touchedSection: touchedSection,
            ),
          ),
        );
  }

  List<PieChartSectionData> buildSections(GraphicModel graphicModel) {
    return List.generate(
      3,
      (i) {
        final isTouched = i == graphicModel.touchedSection;
        final radius = isTouched ? 110.0 : 100.0;
        final fontSize = isTouched ? 20.0 : 16.0;
        final badgeSize = isTouched ? 55.0 : 40.0;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: EventType.personalEvent.color,
              value: graphicModel.percentagePersonalEvents,
              title: '${graphicModel.percentagePersonalEvents}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              badgeWidget: Badge(
                size: badgeSize,
                eventType: EventType.personalEvent,
              ),
              badgePositionPercentageOffset: .98,
            );
          case 1:
            return PieChartSectionData(
              color: EventType.studyEvent.color,
              value: graphicModel.percentageStudyEvents,
              title: '${graphicModel.percentageStudyEvents}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              badgeWidget: Badge(
                size: badgeSize,
                eventType: EventType.studyEvent,
              ),
              badgePositionPercentageOffset: 0.98,
            );
          case 2:
            return PieChartSectionData(
              color: EventType.workEvent.color,
              value: graphicModel.percentageWorkEvents,
              title: '${graphicModel.percentageWorkEvents}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              badgeWidget: Badge(
                size: badgeSize,
                eventType: EventType.workEvent,
              ),
              badgePositionPercentageOffset: 0.98,
            );
        }

        throw Exception();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GraphicBloc>(
      create: (context) => GraphicBloc()..add(ShowGraphicEvent(graphicModel)),
      child: BlocBuilder<GraphicBloc, GraphicState>(
        builder: (context, state) {
          if (state is ShowedGraphicState) {
            return SizedBox(
              width: 100,
              height: 100,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 5,
                  centerSpaceRadius: 0,
                  sections: buildSections(state.graphicModel),
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      onTouchChart(
                        event,
                        pieTouchResponse,
                        context,
                        state.graphicModel,
                      );
                    },
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
