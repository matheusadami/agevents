import 'package:agevents/app/views/profile/components/profile.card.dart';
import 'package:agevents/app/views/profile/components/profile.info.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 25,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 25.0,
                          ),
                        ],
                      ),
                      child: const ProfileCardWidget(),
                    ),
                  ),
                  /*
                  const Positioned(
                    top: 35,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
                        ),
                      ),
                    ),
                  ),
                  */
                  const Positioned(
                    top: 280,
                    left: 0,
                    right: 0,
                    child: ProfileInfoWidget(),
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
      ),
    );
  }
}
