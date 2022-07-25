import 'package:agevents/app/blocs/board/board.event.dart';
import 'package:agevents/app/blocs/board/board.state.dart';
import 'package:agevents/app/models/graphic.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(InitialStateBoardState()) {
    on<LoadBoardEvent>(load);
  }

  void load(LoadBoardEvent event, Emitter emit) async {
    emit(LoadingBoardState());
    // Load the graphic and another datas...

    final graphicModel = GraphicModel(
      percentagePersonalEvents: 30,
      percentageStudyEvents: 40,
      percentageWorkEvents: 40,
    );

    emit(LoadedBoardState(graphicModel: graphicModel));
  }
}
