import 'package:agevents/app/blocs/events/create/event.bloc.dart';
import 'package:agevents/app/blocs/events/create/event.state.dart';
import 'package:agevents/app/views/events/create/components/options.event.priority.dart';
import 'package:agevents/app/views/events/create/components/options.event.type.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/helpers/date.helper.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCreateView extends StatefulWidget {
  const EventCreateView({Key? key}) : super(key: key);

  @override
  State<EventCreateView> createState() => _EventCreateViewState();
}

class _EventCreateViewState extends State<EventCreateView> {
  final nameController = TextEditingController(text: '');
  final dateEventController = TextEditingController(
    text: DateHelper.convertDateFromUSToBR(DateTime.now().toString()),
  );
  final descriptionController = TextEditingController(text: '');

  void openDatepicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateHelper.createDateTimeFromBR(dateEventController.text),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 40),
    );

    if (picker != null) {
      dateEventController.text = DateHelper.convertDateFromUSToBR(
        picker.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Novo Evento',
          style: AppTextStyles.mediumDarkSemiBold,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: BlocConsumer<EventBloc, EventState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case FormEventState:
              return EventCreateFormBody(state: (state as FormEventState));
            case LoadingEventState:
              return const Center(child: CircularProgressIndicator());
          }

          return Container();
        },
      ),
    );
  }
}

class EventCreateFormBody extends StatelessWidget {
  final FormEventState state;

  const EventCreateFormBody({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(
              const Size(double.maxFinite, double.maxFinite),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BlocBuilder<EventBloc, EventState>(
                    buildWhen: (previous, current) {
                      final pName = previous.eventModel.name;
                      final cName = current.eventModel.name;
                      return pName != cName;
                    },
                    builder: (context, state) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormInputWidget(
                        hintText: 'Nome',
                        fillColor: AppColors.gray.withOpacity(0.3),
                        helperText: 'Informe o nome do evento',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormInputWidget(
                      icon: FontAwesomeIcons.solidCalendarCheck,
                      hintText: 'Data',
                      fillColor: AppColors.gray.withOpacity(0.3),
                      helperText: 'Informe a data do evento',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormInputWidget(
                      onTap: () {},
                      hintText: 'Descrição',
                      fillColor: AppColors.gray.withOpacity(0.3),
                      helperText: 'Informe a descrição do evento',
                      isTextArea: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selecione a Categoria',
                          style: AppTextStyles.smallDarkSemiBold,
                        ),
                        const OptionsEventTypeWidget(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selecione a Prioridade',
                          style: AppTextStyles.smallDarkSemiBold,
                        ),
                        const OptionsEventPriorityWidget(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Salvar',
                          style: AppTextStyles.smallWhiteSemiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
