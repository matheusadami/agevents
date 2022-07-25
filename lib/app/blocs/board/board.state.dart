import 'package:agevents/app/models/graphic.model.dart';

abstract class BoardState {
  const BoardState();
}

class InitialStateBoardState extends BoardState {}

class LoadingBoardState extends BoardState {}

class LoadedBoardState extends BoardState {
  final GraphicModel graphicModel;

  LoadedBoardState({required this.graphicModel});
}

class ExceptionBoardState extends BoardState {
  final String message;

  ExceptionBoardState(this.message);
}
