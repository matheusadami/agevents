import 'package:agevents/app/blocs/board/board.bloc.dart';
import 'package:agevents/app/blocs/board/board.event.dart';
import 'package:agevents/app/blocs/board/board.state.dart';
import 'package:agevents/app/models/graphic.model.dart';
import 'package:agevents/app/views/board/components/graphic.widget.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  }
}

class BoardViewBody extends StatelessWidget {
  final GraphicModel graphicModel;

  const BoardViewBody({Key? key, required this.graphicModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Board',
          style: AppTextStyles.mediumDarkSemiBold,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: GraphicWidget(graphicModel: graphicModel),
              ),
            ),
            Expanded(
              flex: 4,
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
                    vertical: 8,
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
