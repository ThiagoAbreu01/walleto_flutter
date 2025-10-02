// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walleto_flutter/app/core/helpers/set_screen_mode.dart';
import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:walleto_flutter/app/core/ui/widgets/custom_text_field/custom_text_field.dart';
import 'package:walleto_flutter/app/core/ui/widgets/global_components/custom_snackbar.dart';
import 'package:walleto_flutter/app/core/ui/widgets/global_components/loader.dart';
import 'package:walleto_flutter/pages/login/login_controller.dart';
import 'package:walleto_flutter/pages/login/login_state.dart';
import 'package:walleto_flutter/pages/register/register_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader {
  late TextEditingController inputEmail;
  late TextEditingController inputPassword;
  late String localAppVersion;
  late String remoteAppVersion;
  bool isCheckBoxMarked = false;
  late LoginController loginController;

  void clearFields() {
    inputEmail.clear();
    inputPassword.clear();
  }

  @override
  void initState() {
    super.initState();
    loginController = context.read();
    inputEmail = TextEditingController();
    inputPassword = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final Map<String, dynamic>? arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      //! Testando o delay do requestFingerPrint. Após alguns testes é possível concluir que é essencial ter
      //! no mínimo uma pequena quantia de Delay, que nesse caso será provido pelas buscas das credencias do usuário no SecureLocalStorage.
      //! Se nenhum delay for fornecido, existe a possíbilidade do dispositivo não estar com a Feature (Recurso) de FingerPrint pronta,
      //! dando trigger no BLoC.status Loading e fazendo o usuário aguardar 30s mesmo quando não necessário.

      bool shouldRequestFingerprint = arguments?['fingerprint'] ?? false;

      await Future.delayed(const Duration(milliseconds: 650));
      await loginController.requestFingerPrintAuthentication(
        isFromInitState: true,
      );

      if (shouldRequestFingerprint) {
      } else {
        await Future.delayed(const Duration(milliseconds: 650));
        loginController.setInitialState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SetScreenMode.fullScreen();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocListener<LoginController, LoginState>(
              listener: (context, state) {
                if (state.status == LoginStatus.waiting &&
                    state.counterIsActive == true &&
                    state.remainingTime! == 30) {
                  CustomSnackbar.showMessage(
                    context: context,
                    text: state.errorMessage.toString(),
                    floating: true,
                    customDuration: const Duration(seconds: 4),
                  );
                }
                if (state.status == LoginStatus.loading) {
                  showLoader(message: 'Autenticando');
                }

                if (state.status == LoginStatus.initial &&
                    state.errorMessage != null) {
                  hideLoader();
                  CustomSnackbar.showMessage(
                    context: context,
                    text: state.errorMessage.toString(),
                    floating: true,
                    customDuration: const Duration(seconds: 4),
                  );
                }
                if (state.status == LoginStatus.initial &&
                    state.errorMessage == null &&
                    state.contaConectada != null) {
                  hideLoader();
                  //! ADICIONAR NAVEGAÇÃO PARA PAGINA INICIAL
                }
              },
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: BlocBuilder<LoginController, LoginState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: context.height,
                          width: context.width,
                          // child: Image.asset(
                          //   'assets/images/fundo_tela_login.jpeg',
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 100),
                              SizedBox(
                                height: 70,
                                width: 200,
                                // child: Image.asset(
                                //   'assets/images/logo_solpi_fundo_transparente.png',
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                              SizedBox(height: 60),
                              CustomTextField(
                                name: 'email',
                                color: context.tertiaryColor,
                                label: 'Email',
                                isPasswordField: false,
                                textEditingController: inputEmail,
                                radius: BorderRadius.circular(8),
                              ),
                              SizedBox(height: 20),
                              CustomTextField(
                                name: 'senha',
                                color: context.tertiaryColor,
                                label: 'Senha',
                                isPasswordField: true,
                                textEditingController: inputPassword,
                                radius: BorderRadius.circular(8),
                                hintColor: Colors.red,
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: context.percentWidth(0.075),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      checkColor: context.secondaryColor,
                                      value: isCheckBoxMarked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckBoxMarked = value!;
                                        });
                                      },
                                      side: BorderSide(
                                        color: context.tertiaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isCheckBoxMarked = !isCheckBoxMarked;
                                        });
                                      },
                                      child: Text(
                                        'Salvar/Atualizar Credenciais (para Digital)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                          color: context.tertiaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                color: context.secondaryColor,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    loginController.login(
                                      inputEmail.text,
                                      inputPassword.text,
                                      isCheckBoxMarked,
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: context.percentWidth(0.50),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Entrar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         RecoverPasswordRouter().page,
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  'Esqueceu sua senha?',
                                  style: TextStyle(
                                    color: context.tertiaryColor,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              SizedBox(height: context.percentHeight(0.05)),
                              Builder(
                                builder: (context) {
                                  if (!Platform.isWindows) {
                                    return GestureDetector(
                                      onTap: () {
                                        loginController
                                            .requestFingerPrintAuthentication(
                                              isFromInitState: false,
                                            );
                                      },
                                      child: Icon(
                                        Icons.fingerprint,
                                        size: 70,
                                        color: context.tertiaryColor,
                                      ),
                                    );
                                  }
                                  return SizedBox.shrink();
                                },
                              ),
                              SizedBox(height: context.percentHeight(0.05)),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Não possui uma conta? ',
                                      style: TextStyle(
                                        color: context.tertiaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Cadastre-se aqui',
                                      recognizer:
                                          TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          RegisterRouter.page,
                                                ),
                                              );
                                            },
                                      style: TextStyle(
                                        color: context.tertiaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
