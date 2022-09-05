import 'package:agevents/app/blocs/signin/signin.bloc.dart';
import 'package:agevents/app/blocs/signin/signin.event.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onTapGoSignUp() {
    NavigationService.navigateTo('/signup');
  }

  void onTapForgotPassword() {
    NavigationService.navigateTo('/forgot-password');
  }

  void onTapSignIn() {
    final submitFormEvent = SubmitFormSignInEvent(
      emailController.text,
      passwordController.text,
    );
    NavigationService.context!.read<SignInBloc>().add(submitFormEvent);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.background,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'Bem-vindo ao \n',
                              style: AppTextStyles.bigPrimarySemiBold,
                              children: [
                                TextSpan(
                                  text: 'AgEvents',
                                  style: AppTextStyles.bigPrimarySemiBold,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Preencha os dados abaixo para entrar no sistema',
                          style: AppTextStyles.smallGraySemiBold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormInputWidget(
                          controller: emailController,
                          hintText: 'E-mail',
                          icon: FontAwesomeIcons.solidEnvelope,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormInputWidget(
                          controller: passwordController,
                          isObscureText: true,
                          hintText: 'Senha',
                          icon: FontAwesomeIcons.asterisk,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: onTapForgotPassword,
                            child: Text(
                              'Esqueci minha senha',
                              style: AppTextStyles.verySmallDarkSemiBold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: CommonButtonWidget(
                            label: 'Entrar',
                            onTap: onTapSignIn,
                          ),
                        ),
                      ),
                      /*
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: DividerSignIn(size: size),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ButtonSignInGoogle(
                          size: size,
                          onTap: () {},
                        ),
                      ),
                      */
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text.rich(
                        TextSpan(
                          text: 'Ainda não tem conta? ',
                          style: AppTextStyles.smallGraySemiBold,
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = onTapGoSignUp,
                              text: 'Registre-se',
                              style: AppTextStyles.smallPrimaryBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
