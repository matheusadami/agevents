import 'package:agevents/app/blocs/board/board.bloc.dart';
import 'package:agevents/app/blocs/board/board.event.dart';
import 'package:agevents/app/blocs/board/board.state.dart';
import 'package:agevents/app/views/board/components/board.card.event.dart';
import 'package:agevents/app/views/board/components/graphic.widget.dart';
import 'package:agevents/core/components/common.error.message.dart';
import 'package:agevents/core/components/common.events.not.found.dart';
import 'package:agevents/core/components/common.loading.widget.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardBloc()..add(LoadBoardEvent()),
      child: BlocBuilder<BoardBloc, BoardState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ExceptionBoardState:
              return const CommonErrorMessage(
                message: 'Não foi possível carregar a Board.',
              );
            case LoadingBoardState:
              return const CommonLoadingWidget();
            case LoadedBoardState:
              return BoardViewBody(
                state: (state as LoadedBoardState),
              );
          }

          return Container();
        },
      ),
    );
  }
}

class BoardViewBody extends StatelessWidget {
  final LoadedBoardState state;

  const BoardViewBody({Key? key, required this.state}) : super(key: key);

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
                child: !state.graphicModel.isEmptySections
                    ? GraphicWidget(graphicModel: state.graphicModel)
                    : const CommonEventsNotFound(),
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
                    children: [
                      BoardEventCard(
                        qtde: state.qtdeEvents,
                        label: 'Total de Eventos',
                        icon: FontAwesomeIcons.barsStaggered,
                        iconColor: AppColors.gray,
                      ),
                      BoardEventCard(
                        qtde: state.qtdeCompletedEvents,
                        label: 'Completo',
                        icon: EventStatus.completed.iconData,
                        iconColor: EventStatus.completed.color,
                      ),
                      BoardEventCard(
                        qtde: state.qtdeDoingEvents,
                        label: 'Em andamento',
                        icon: EventStatus.doing.iconData,
                        iconColor: EventStatus.doing.color,
                      ),
                      BoardEventCard(
                        qtde: state.qtdePendingEvents,
                        label: 'Pendente',
                        icon: EventStatus.pending.iconData,
                        iconColor: EventStatus.pending.color,
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
