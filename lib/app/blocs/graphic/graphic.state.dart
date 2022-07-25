import 'package:agevents/app/models/graphic.model.dart';

abstract class GraphicState {
  GraphicState();
}

class InitialStateGraphicState extends GraphicState {}

class ShowedGraphicState extends GraphicState {
  final GraphicModel graphicModel;

  ShowedGraphicState(this.graphicModel);
}
