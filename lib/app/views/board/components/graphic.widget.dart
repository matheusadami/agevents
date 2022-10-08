import 'package:agevents/app/blocs/graphic/graphic.bloc.dart';
import 'package:agevents/app/blocs/graphic/graphic.event.dart';
import 'package:agevents/app/blocs/graphic/graphic.state.dart';
import 'package:agevents/app/models/graphic.model.dart';
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

    final showGraphicEvent = ShowGraphicEvent(
      graphicModel.copyWith(
        touchedSection: touchedSection,
      ),
    );
    context.read<GraphicBloc>().add(showGraphicEvent);
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
                  sections: state.graphicModel.buildSections(),
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
