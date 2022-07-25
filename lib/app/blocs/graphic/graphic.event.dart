import 'package:agevents/app/models/graphic.model.dart';

abstract class GraphicEvent {
  GraphicEvent();
}

class ShowGraphicEvent extends GraphicEvent {
  final GraphicModel graphicModel;

  ShowGraphicEvent(this.graphicModel);
}
