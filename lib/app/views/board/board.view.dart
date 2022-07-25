import 'package:agevents/app/blocs/board/board.bloc.dart';
import 'package:agevents/app/blocs/board/board.event.dart';
import 'package:agevents/app/blocs/board/board.state.dart';
import 'package:agevents/app/models/graphic.model.dart';
import 'package:agevents/app/views/board/components/graphic.widget.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardView extends StatefulWidget {
  const BoardView({Key? key}) : super(key: key);

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  void initState() {
    context.read<BoardBloc>().add(LoadBoardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardBloc, BoardState>(
      listener: (context, state) {
        if (state is ExceptionBoardState) {
          // to do something...
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingBoardState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case LoadedBoardState:
            return BoardViewBody(
              graphicModel: (state as LoadedBoardState).graphicModel,
            );
        }

        return Container();
      },
    );

    /*
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SizedBox(
                  width: 145,
                  height: 135,
                  child: TaskCard(
                    icon: FontAwesomeIcons.solidUser,
                    label: 'Pessoal',
                    iconColor: Theme.of(context).colorScheme.primary,
                    qtdeTasks: 0,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 145,
                  height: 135,
                  child: TaskCard(
                    icon: FontAwesomeIcons.book,
                    label: 'Estudos',
                    qtdeTasks: 0,
                    iconColor: Theme.of(context).colorScheme.tertiary,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 145,
                  height: 135,
                  child: TaskCard(
                    icon: FontAwesomeIcons.briefcase,
                    label: 'Trabalho',
                    iconColor: Theme.of(context).colorScheme.secondary,
                    qtdeTasks: 0,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 145,
                  height: 135,
                  child: TaskCard(
                    icon: FontAwesomeIcons.plus,
                    label: 'Criar Evento',
                    iconColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    isShowQtdeTasks: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/createTask');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.pen,
          size: 24,
          color: AppColors.white,
        ),
      ),
    );
    */
  }
}

class BoardViewBody extends StatelessWidget {
  final GraphicModel graphicModel;

  const BoardViewBody({Key? key, required this.graphicModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.chartPie,
                        color: AppColors.white,
                        size: 20,
                      ),
                      /*
                      const SizedBox(width: 15),
                      Text(
                        'Board',
                        style: AppTextStyles.mediumWhiteSemiBold,
                      ),
                      */
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: GraphicWidget(graphicModel: graphicModel),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      BoardEventCard(
                        qtde: 12,
                        label: 'Total de Eventos',
                        icon: FontAwesomeIcons.barsStaggered,
                        iconColor: AppColors.gray,
                      ),
                      BoardEventCard(
                        qtde: 5,
                        label: 'Completo',
                        icon: FontAwesomeIcons.solidCircleCheck,
                        iconColor: AppColors.secondary,
                      ),
                      BoardEventCard(
                        qtde: 7,
                        label: 'Em andamento',
                        icon: FontAwesomeIcons.spinner,
                        iconColor: AppColors.primary,
                      ),
                      BoardEventCard(
                        qtde: 20,
                        label: 'Pendente',
                        icon: FontAwesomeIcons.solidClock,
                        iconColor: AppColors.tertiary,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoardEventCard extends StatelessWidget {
  final int qtde;
  final String label;
  final IconData icon;
  final Color iconColor;

  const BoardEventCard({
    Key? key,
    required this.qtde,
    required this.label,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.gray.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      icon,
                      size: 16,
                      color: iconColor,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  label,
                  style: AppTextStyles.verySmallDarkSemiBold,
                ),
              ],
            ),
            Text(
              qtde.toString(),
              style: AppTextStyles.verySmallPrimaryBold,
            ),
          ],
        ),
      ),
    );
  }
}
