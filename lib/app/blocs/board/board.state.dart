import 'package:agevents/app/models/graphic.model.dart';

abstract class BoardState {
  const BoardState();
}

class InitialStateBoardState extends BoardState {}

class LoadingBoardState extends BoardState {}

class LoadedBoardState extends BoardState {
  final int qtdeEvents;
  final int qtdeDoingEvents;
  final int qtdePendingEvents;
  final int qtdeCompletedEvents;
  final GraphicModel graphicModel;

  LoadedBoardState({
    required this.qtdeEvents,
    required this.qtdeDoingEvents,
    required this.qtdePendingEvents,
    required this.qtdeCompletedEvents,
    required this.graphicModel,
  });
}

class ExceptionBoardState extends BoardState {
  final String message;

  ExceptionBoardState(this.message);
}
