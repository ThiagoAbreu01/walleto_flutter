// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart' as auth_android;
import 'package:granio_flutter/app/core/exceptions/finger_print_exception.dart';
// import 'package:local_auth_ios/local_auth_ios.dart' as auth_ios;

class FingerPrintService {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      throw FingerPrintException(
          message: 'Inválido para seu sistema operacional.');
      // return false;
    } on MissingPluginException {
      throw MissingPluginException('Inválido para seu sistema operacional.');
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) {
      throw FingerPrintException(
          message:
              'A autenticação por biometria não está habilitada nesse dispositivo.');
    }
    try {
      bool result = await _auth.authenticate(
        authMessages: [
          const auth_android.AndroidAuthMessages(
            biometricHint: 'Caso falhe 5 vezes, apenas aguarde.',
            cancelButton: 'Cancelar',
            signInTitle: 'Autenticação por Biometria',
            biometricSuccess: 'Sucesso!',
            biometricNotRecognized: 'Biometria não reconhecida.',
            goToSettingsButton: 'Configurações',
          ),
          // const auth_ios.IOSAuthMessages(
          //   cancelButton: 'Cancelar',
          //   goToSettingsButton: 'Configurações',
          // ),
        ],
        localizedReason: 'Escaneie sua digital para continuar.',
        options: const AuthenticationOptions(
            stickyAuth: false, useErrorDialogs: true, biometricOnly: true),

        // ignore: void_checks
      );
      if (result) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.biometricOnlyNotSupported) {
        throw FingerPrintException(
            message: 'Biometria não suportada neste dispositivo.');
      } else if (e.code == auth_error.lockedOut) {
        throw FingerPrintException(
            message:
                'Bloqueado temporariamente por muitas tentativas.\nTente novamente daqui 30 segundos\nOu acesse com o seu email e senha normalmente.');
      } else if (e.code == auth_error.notAvailable) {
        throw FingerPrintException(
            message:
                'Para utilizar esse recurso, primeiro você precisa habilitá-lo.\nVá para Configurações -> Segurança para adicionar sua biometria.');
      } else if (e.code == auth_error.notEnrolled) {
        throw FingerPrintException(message: 'Cancelado com sucesso!');
      } else if (e.code == auth_error.otherOperatingSystem) {
        throw FingerPrintException(
            message: 'Inválido para seu sistema operacional.');
      } else if (e.code == auth_error.passcodeNotSet) {
        throw FingerPrintException(message: 'Cancelado com sucesso!');
      } else if (e.code == auth_error.permanentlyLockedOut) {
        throw FingerPrintException(
            message:
                'Bloqueado nesta sessão por muitas tentativas.\nBloqueie seu celular e desbloqueie para tentar novamente.');
      } else if (e.code.contains('getAvailableBiometrics')) {
        throw FingerPrintException(
            message: 'Inválido para seu sistema operacional.');
      } else {
        throw FingerPrintException(message: e.message);
      }
    }
  }
}
