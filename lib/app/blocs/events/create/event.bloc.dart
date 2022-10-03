import 'package:agevents/app/blocs/events/create/event.event.dart';
import 'package:agevents/app/blocs/events/create/event.state.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(FormEventState()) {
    on<SubmitFormEventEvent>(submitForm);
  }

  void submitForm(SubmitFormEventEvent event, Emitter emit) async {
    try {
      emit(LoadingEventState());

      AlertsHelper.showSuccessSnackBar('Evento cadastrado com sucesso');
      emit(SuccessCreatedEventState());
    } on CustomException catch (e) {
      AlertsHelper.showWarnSnackBar(e.message);
      emit(FormEventState());
    }
  }
}
