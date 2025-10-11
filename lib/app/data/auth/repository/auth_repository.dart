import 'dart:io';

import 'package:granio_flutter/app/core/exceptions/failure.dart';
import 'package:granio_flutter/app/core/exceptions/invalid_credentials_exception.dart';
import 'package:granio_flutter/app/core/exceptions/user_exists_exception.dart';
import 'package:granio_flutter/app/core/exceptions/wrong_email_confirmation_code_exception.dart';
import 'package:granio_flutter/app/core/local_storage/secure_storage/secure_local_storage.dart';
import 'package:granio_flutter/app/core/logger/logger.dart';
import 'package:granio_flutter/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:granio_flutter/app/core/rest_client/rest_client_exception.dart';
import 'package:granio_flutter/app/data/auth/repository/i_auth_repository.dart';
import 'package:granio_flutter/app/models/confirm_login_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:granio_flutter/pages/register/view_models/register_view_model.dart';

class AuthRepository implements IAuthRepository {
  final DioRestClient dio;
  final SecureLocalStorage secureLocalStorage;
  final Logger log;

  const AuthRepository({
    required this.dio,
    required this.secureLocalStorage,
    required this.log,
  });

  @override
  Future<Map<String, String>?> fetchSecureLocalStorageLoginData() async {
    var resultEmail = await secureLocalStorage.read('email');
    var resultPassword = await secureLocalStorage.read('password');

    if (resultEmail == null && resultPassword == null) {
      return null;
    }
    return <String, String>{'$resultEmail': '$resultPassword'};
  }

  @override
  Future<void> saveDataToLocalStorage(String email, String password) async {
    await secureLocalStorage.write('email', email);
    await secureLocalStorage.write('password', password);
  }

  @override
  Future<void> register(RegisterViewModel registerViewModel) async {
    try {
      await dio.unauth().post(
        'auth/register',
        data: {
          "nome": registerViewModel.nome,
          "email": registerViewModel.email,
          // "cpf": registerViewModel.cpf,
          "telephone": registerViewModel.telephone,
          "password": registerViewModel.password,
          "confirm_password": registerViewModel.confirmPassword,
        },
      );
    } on RestClientException catch (e) {
      if (e.statusCode == 403 &&
          e.response.data['message'].contains(
            'Usuário já cadastrado na base de dados.',
          )) {
        log.error(e.message.toString());
        throw UserExistsException(
            message: 'Usuário já cadastrado na base de dados com esse E-mail');
      }
      if (e.statusCode == null || e.statusCode.toString() == 'null') {
        throw Failure(message: 'Erro de conexão com o servidor.');
      }
      throw Failure(message: 'Houve um erro ao cadastrar usuário');
    }
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      var response = await dio.unauth().post(
        'auth/',
        data: {
          "email": email,
          "pass_crypto": password,
          "social_login": false,
        },
      );

      return response.data['access_token'];
    } on RestClientException catch (e, s) {
      log.error(e, s);
      if (e.statusCode == null || e.statusCode.toString() == 'null') {
        throw Failure(message: 'Erro de conexão com o servidor.');
      }
      throw InvalidCredentialsException(message: e.response.data['message']);
    }
  }

  @override
  Future<ConfirmLogin> confirmLogin() async {
    late String? deviceToken;

    if (kIsWeb) {
      deviceToken = 'Web';

      try {
        var response = await dio.auth().patch(
          'auth/confirm',
          data: {
            "ios_token": null,
            "android_token": deviceToken,
          },
        );

        return ConfirmLogin.fromMap(response.data);
      } on RestClientException catch (e, s) {
        log.error(e, s);
        if (e.statusCode == null || e.statusCode.toString() == 'null') {
          throw Failure(message: 'Erro de conexão com o servidor.');
        }

        throw Failure(message: 'Erro ao confirmar Login.');
      }
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      deviceToken = 'Desktop';

      try {
        var response = await dio.auth().patch(
          'auth/confirm',
          data: {
            "ios_token": null,
            "android_token": deviceToken,
          },
        );

        return ConfirmLogin.fromMap(response.data);
      } on RestClientException catch (e, s) {
        log.error(e, s);
        if (e.statusCode == null || e.statusCode.toString() == 'null') {
          throw Failure(message: 'Erro de conexão com o servidor.');
        }

        throw Failure(message: 'Erro ao confirmar Login.');
      }
    } else {
      // deviceToken = await FirebaseMessaging.instance.getToken(); //! TODO: Implementar Firebase Messaging para Android e iOS
      deviceToken =  'APP';

      try {
        var response = await dio.auth().patch(
          'auth/confirm',
          data: {
            "ios_token": Platform.isIOS ? deviceToken : null,
            "android_token": Platform.isAndroid ? deviceToken : null,
          },
        );

        return ConfirmLogin.fromMap(response.data);
      } on RestClientException catch (e, s) {
        log.error(e, s);
        if (e.statusCode == null || e.statusCode.toString() == 'null') {
          throw Failure(message: 'Erro de conexão com o servidor.');
        }
        throw Failure(
          message: 'Erro ao confirmar Login.',
        );
      }
    }
  }

  @override
  Future<void> sendEMailConfirmationCode(String email) async {
    try {
      await dio.unauth().put(
        'auth/send-email-confirm-code',
        data: {
          "email": email,
        },
      );
    } on RestClientException catch (e, s) {
      log.error(e, s);
      if (e.statusCode == null || e.statusCode.toString() == 'null') {
        throw Failure(message: 'Erro de conexão com o servidor.');
      }
      throw Failure(message: 'Houve um erro ao enviar e-mail de confirmação');
    }
  }

  @override
  Future<void> checkEMailConfirmationCode(String email, String code) async {
    try {
      var myRequest = await dio.unauth().put(
        'auth/validate-confirm-code',
        data: {
          "email": email,
          "code": code,
        },
      );
      if (myRequest.data['message'] == 'Código de confirmação incorreto.') {
        throw WrongEmailConfirmationCodeException(
            message: '${myRequest.data['message']}');
      }
    } on RestClientException catch (e, s) {
      log.error(e.message, s);
      rethrow;
    }
  }

  @override
  Future<void> sendRecoveryEmail(String email) async {
    try {
      await dio.unauth().put(
        'auth/send-email-recovery-password-code',
        data: {
          "email": email,
        },
      );
    } on RestClientException catch (e) {
      throw Failure(message: e.response.data['message']);
    }
  }

  @override
  Future<void> checkRecoveryCode(String email, String code) async {
    try {
      var myRequest = await dio.unauth().put(
        'auth/validate-recover-password-code',
        data: {
          "email": email,
          "code": code,
        },
      );
      if (myRequest.data['message'] == 'Código de recuperação incorreto.') {
        throw WrongEmailConfirmationCodeException(
            message: '${myRequest.data['message']}');
      }
    } on RestClientException catch (e) {
      if (e.response.data['message'] == 'Código de recuperação incorreto.') {
        throw WrongEmailConfirmationCodeException(
            message: 'Código de confirmação incorreto.');
      } else {
        throw Failure(message: e.response.data['message']);
      }
    }
  }

  @override
  Future<void> changePassword(
      String email, String newPassword, String newPasswordConfirmation) async {
    try {
      var myRequest = await dio.unauth().put(
        'auth/change-password',
        data: {
          "email": email,
          "password": newPassword,
        },
      );
      if (myRequest.data['message'] == 'A senha inserida é inválida') {
        throw InvalidCredentialsException(
            message: '${myRequest.data['message']}');
      }
    } on RestClientException catch (e, s) {
      log.error(e.message, s);
      rethrow;
    }
  }
}
