import 'package:flutter/services.dart';
import 'package:granio_flutter/app/core/helpers/custom_input_formatter.dart';
import 'package:granio_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:granio_flutter/app/core/ui/widgets/custom_text_field/custom_text_field.dart';
import 'package:granio_flutter/pages/register/view_models/register_view_model.dart';

import '../../app/core/ui/extensions/theme_extension.dart';
import '../../app/core/ui/widgets/global_components/custom_snackbar.dart';
import '../../app/core/ui/widgets/global_components/loader.dart';
import 'register_controller.dart';
import 'register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with Loader {
  late RegisterController controller;
  // final _scrollController = ScrollController();
  final _controllerInputNome = TextEditingController();
  final _controllerInputEmail = TextEditingController();
  final _controllerInputCPF = TextEditingController();
  final _controllerInputSenha = TextEditingController();
  final _controllerInputConfirmarSenha = TextEditingController();
  final _controllerInputTelefone = TextEditingController();

  void clearFields() {
    setState(() {
      _controllerInputNome.text = '';
      _controllerInputEmail.text = '';
      _controllerInputCPF.text = '';
      _controllerInputSenha.text = '';
      _controllerInputConfirmarSenha.text = '';
      _controllerInputTelefone.text = '';
    });
    controller.changeIsTermosSelected(false);
  }

  @override
  void initState() {
    super.initState();

    controller = context.read();
  }

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.selected,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      if (context.isDarkTheme) {
        return context.primaryColor;
      } else {
        return context.tertiaryColor;
      }
    } else {
      if (context.isDarkTheme) {
        return context.tertiaryColor;
      } else {
        return context.tertiaryColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<RegisterController, RegisterState>(
                listener: (context, state) {
                  if (state.status == RegisterStatus.loading) {
                    showLoader(message: 'Realizando o seu cadastro! 👷');
                  } else if (state.status == RegisterStatus.success) {
                    hideLoader();
                    Navigator.pop(context);
                    CustomSnackbar.showMessage(
                      context: context,
                      text: 'Conta criada com sucesso! 👷',
                      customDuration: const Duration(
                        seconds: 3,
                      ),
                    );

                    // Navigator.pushReplacement(
                    //   context,
                    //   CustomPageNavigator(
                    //     child: const ConfirmEmailRouter(contaConectada: null).page,
                    //     settings: RouteSettings(
                    //       name: '/confirm-email',
                    //       arguments: <String, dynamic>{
                    //         'isFromRegisterPage': true,
                    //         'user_email': context
                    //             .read<RegisterController>()
                    //             .state
                    //             .registerViewModel
                    //             ?.email,
                    //       },
                    //     ),
                    //     direction: AxisDirection.left,
                    //   ),
                    // );
                  } else if (state.status == RegisterStatus.error) {
                    hideLoader();
                    CustomSnackbar.showMessage(
                      context: context,
                      text: state.errorMessage!,
                      customDuration: const Duration(
                        seconds: 3,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  // return Container(color: Colors.red,);
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
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          color: context.tertiaryColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 45,
                              width: 45,
                              child: Icon(
                                Icons.arrow_back,
                                color: context.primaryColor,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 80),
                            Text(
                              'Cadastro',
                              style: TextStyle(
                                color: context.tertiaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              name: 'Input Nome',
                              color: context.tertiaryColor,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.deny(
                              //       RegExp(r"\s")), // This line filters out spaces
                              // ],
                              width: context.percentWidth(0.9),
                              radius: BorderRadius.circular(8),
                              isPasswordField: false,
                              textCapitalization: TextCapitalization.none,
                              textEditingController: _controllerInputNome,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              icon: Icons.person,
                              iconColor: context.primaryColor,
                              iconSize: 30,
                              label: 'Nome e Sobrenome',
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              name: 'Input Email',
                              color: context.tertiaryColor,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(
                                    r"\s")), // This line filters out spaces
                              ],
                              width: context.percentWidth(0.9),
                              radius: BorderRadius.circular(8),
                              isPasswordField: false,
                              textCapitalization: TextCapitalization.none,
                              textEditingController: _controllerInputEmail,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.email,
                              iconColor: context.primaryColor,
                              iconSize: 30,
                              label: 'E-mail',
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              name: 'Input CPF',
                              color: context.tertiaryColor,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(
                                    r"\s")), // This line filters out spaces
                              ],
                              width: context.percentWidth(0.9),
                              radius: BorderRadius.circular(8),
                              isPasswordField: false,
                              textCapitalization: TextCapitalization.none,
                              textEditingController: _controllerInputCPF,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              icon: Icons.numbers,
                              iconColor: context.primaryColor,
                              iconSize: 30,
                              label: 'CPF',
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              name: 'Input telefone',
                              color: context.tertiaryColor,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(
                                    r"\s")), // This line filters out spaces
                              ],
                              width: context.percentWidth(0.9),
                              radius: BorderRadius.circular(8),
                              isPasswordField: false,
                              textCapitalization: TextCapitalization.none,
                              textEditingController: _controllerInputTelefone,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              icon: Icons.phone,
                              iconColor: context.primaryColor,
                              iconSize: 30,
                              label: 'Telefone',
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              name: 'Input Senha',
                              color: context.tertiaryColor,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(
                                    r"\s")), // This line filters out spaces
                              ],
                              radius: BorderRadius.circular(8),
                              width: context.percentWidth(0.9),
                              isPasswordField: true,
                              textCapitalization: TextCapitalization.none,
                              textEditingController: _controllerInputSenha,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              icon: Icons.lock,
                              iconColor: context.primaryColor,
                              iconSize: 30,
                              label: 'Senha',
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              name: 'Confirmar Senha',
                              color: context.tertiaryColor,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(
                                    r"\s")), // This line filters out spaces
                              ],
                              width: context.percentWidth(0.9),
                              radius: BorderRadius.circular(8),
                              isPasswordField: true,
                              textCapitalization: TextCapitalization.none,
                              textEditingController:
                                  _controllerInputConfirmarSenha,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              icon: Icons.lock,
                              iconColor: context.primaryColor,
                              iconSize: 30,
                              label: 'Confirmar Senha',
                            ),
                            SizedBox(height: 20),
                            Material(
                              borderRadius: BorderRadius.circular(8),
                              color: context.secondaryColor,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () async {
                                  await controller.register(
                                    RegisterViewModel(
                                      nome: CustomInputFormatter
                                          .removeEspacosInicioFim(
                                        _controllerInputNome.text,
                                      ),
                                      email: _controllerInputEmail.text,
                                      // cpf: _controllerInputCPF.text,
                                      telephone: _controllerInputTelefone.text,
                                      password: _controllerInputSenha.text,
                                      confirmPassword:
                                          _controllerInputConfirmarSenha.text,
                                      // checkBoxIsChecked: state.isTermosSelected!,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: context.percentWidth(0.50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Cadastrar-se',
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
                            SizedBox(height: 35.h),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
