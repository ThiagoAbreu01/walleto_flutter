// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:walleto_flutter/app/models/logged_user_model.dart';

enum LoginStatus {
  // ignore: constant_identifier_names
  pre_request, //!Loading the authRequest.
  loading,
  waiting, //! Waiting for FingerPrint to Refresh
  initial,
}

class LoginState {
  final LoginStatus status;
  final LoggedUserModel? contaConectada;
  final String? loginEmail;
  final String? loginSenha;
  int? remainingTime;
  bool? counterIsActive;
  String? localAppVersion;
  String? remoteAppVersion;

  String? errorMessage;

  LoginState({
    this.status = LoginStatus.initial,
    this.contaConectada,
    this.loginEmail,
    this.loginSenha,
    this.remainingTime,
    this.counterIsActive,
    this.localAppVersion,
    this.remoteAppVersion,
    this.errorMessage,
  });

  LoginState copyWith({
    LoginStatus? status,
    LoggedUserModel? contaConectada,
    String? loginEmail,
    String? loginSenha,
    int? remainingTime,
    bool? counterIsActive,
    String? errorMessage,
    String? localAppVersion,
    String? remoteAppVersion,
  }) {
    return LoginState(
      status: status ?? this.status,
      contaConectada: contaConectada,
      loginEmail: loginEmail,
      loginSenha: loginSenha,
      remainingTime: remainingTime,
      counterIsActive: counterIsActive,
      errorMessage: errorMessage,
      localAppVersion: localAppVersion,
      remoteAppVersion: remoteAppVersion,
    );
  }
}
