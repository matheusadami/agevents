import 'package:agevents/app/blocs/graphic/graphic.event.dart';
import 'package:agevents/app/blocs/graphic/graphic.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphicBloc extends Bloc<GraphicEvent, GraphicState> {
  GraphicBloc() : super(InitialStateGraphicState()) {
    on<ShowGraphicEvent>(show);
  }

  void show(ShowGraphicEvent event, Emitter emit) {
    emit(ShowedGraphicState(event.graphicModel));
  }
}
