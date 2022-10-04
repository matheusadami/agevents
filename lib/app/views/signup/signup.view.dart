import 'package:agevents/app/blocs/signup/signup.bloc.dart';
import 'package:agevents/app/blocs/signup/signup.event.dart';
import 'package:agevents/app/blocs/signup/signup.state.dart';
import 'package:agevents/core/components/common.button.widget.dart';
import 'package:agevents/core/components/common.loading.widget.dart';
import 'package:agevents/core/components/text.form.input.dart';
import 'package:agevents/core/helpers/alerts.helper.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:agevents/core/theme/app.colors.dart';
import 'package:agevents/core/theme/app.textstyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case FormSignUpState:
                  return SignUpBody();
                case LoadingSignUpState:
                  return const CommonLoadingWidget();
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);

  final nameController = TextEditingController(text: '');
  final phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    type: MaskAutoCompletionType.eager,
  );
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  void onTapGoSignIn() {
    NavigationService.navigateTo('/signin');
  }

  void onSubmitForm(BuildContext context) {
    if (!phoneMask.isFill()) {
      AlertsHelper.showWarnSnackBar('Por favor informe seu celular');
    } else {
      final submitFormEvent = SubmitFormSignUpEvent(
        name: nameController.text,
        phone: phoneMask.getUnmaskedText(),
        email: emailController.text,
        password: passwordController.text,
      );

      NavigationService.context!.read<SignUpBloc>().add(submitFormEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registre-se',
                      style: AppTextStyles.bigPrimarySemiBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Preencha os dados abaixo para se registrar no sistema',
                    style: AppTextStyles.smallGraySemiBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormInputWidget(
                    controller: nameController,
                    hintText: 'Nome',
                    icon: FontAwesomeIcons.solidUser,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormInputWidget(
                    inputFormatters: [phoneMask],
                    keyboardType: TextInputType.number,
                    hintText: 'Celular',
                    icon: FontAwesomeIcons.phone,
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
                    isObscureText: true,
                    controller: passwordController,
                    hintText: 'Senha',
                    icon: FontAwesomeIcons.asterisk,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: CommonButtonWidget(
                      label: 'Confirmar',
                      onTap: () => onSubmitForm(context),
                    ),
                  ),
                ),
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
                    text: 'Já tem uma conta? ',
                    style: AppTextStyles.smallGraySemiBold,
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = onTapGoSignIn,
                        text: 'Entrar',
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
    );
  }
}
