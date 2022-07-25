import 'package:agevents/core/components/event.list.view.dart';
import 'package:agevents/core/providers/navigation.bar.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  late final NavigationBarProvider navigationBarProvider;

  void onTapSearchEvents() {
    navigationBarProvider.onChangeCurrentPage(1);
  }

  void onTapAllEvents() {
    navigationBarProvider.onChangeCurrentPage(2);
  }

  @override
  void didChangeDependencies() {
    navigationBarProvider = context.read<NavigationBarProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            FontAwesomeIcons.house,
                            size: 20,
                            color: AppColors.white,
                          ),
                          Icon(
                            FontAwesomeIcons.solidBell,
                            size: 20,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      /*
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'Olá, ',
                            style: AppTextStyles.mediumWhiteSemiBold,
                            children: [
                              TextSpan(
                                text: 'Matheus Adami',
                                style: AppTextStyles.smallGraySemiBold,
                              )
                            ],
                          ),
                        ),
                      ),
                      */
                      /*
                      Text(
                        'Busque pelos melhores e principais eventos',
                        style: AppTextStyles.mediumWhiteSemiBold,
                      ),
                      TextFormInputWidget(
                        onTap: onTapSearchEvents,
                        hintText: 'Pesquise aqui...',
                        fillColor: AppColors.white,
                      ),
                      */
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Eventos de hoje',
                            style: AppTextStyles.smallDarkSemiBold,
                          ),
                          TextButton(
                            onPressed: onTapAllEvents,
                            child: Text(
                              'Ver todos',
                              style: AppTextStyles.verySmallPrimaryBold,
                            ),
                          ),
                        ],
                      ),
                      const EventListView(isShowFavorite: false),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
