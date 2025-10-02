import 'package:dio/dio.dart';

import '../../../core/exceptions/failure.dart';
import '../../../core/logger/logger.dart';
import '../../../core/rest_client/dio/dio_rest_client.dart';
import '../../../core/rest_client/rest_client_exception.dart';
import '../../../models/logged_user_model.dart';
import 'i_user_repository.dart';
import 'dart:io';

class UserRepository implements IUserRepository {
  final DioRestClient dio;
  final Logger log;
  UserRepository({
    required this.dio,
    required this.log,
  });

  @override
  Future<LoggedUserModel> getContaConectada() async {
    try {
      final result = await dio.auth().get('user/');

      return LoggedUserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      log.error(e, s);
      if (e.statusCode == null || e.statusCode.toString() == 'null') {
        throw Failure(message: 'Erro de conexão com o servidor.');
      }
      log.error('Erro ao obter informações de conta conectada', e, s);
      throw Failure(message: e.message);
    }
  }

  @override
  Future<LoggedUserModel> updateProfileImage(File file, int userID) async {
    try {
      final fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          "file": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      await dio.auth().post(
        'user/update-image',
        data: formData,
        headers: {
          "Content-Type": "multipart/form-data",
        },
      );

      return getContaConectada();
      // return resultsImage.data['message'];
    } on RestClientException catch (e, s) {
      log.error(e, s);
      if (e.statusCode == null || e.statusCode.toString() == 'null') {
        throw Failure(message: 'Erro de conexão com o servidor.');
      }
      log.error('Erro ao atualizar imagem de perfil do usuário.', e, s);
      throw Failure(message: 'Houve um erro ao atualizar sua imagem de perfil');
    }
  }

  @override
  Future<String> deleteAccount(LoggedUserModel contaConectada) async {
    try {
      final response =
          await dio.auth().delete('user/delete-accont/${contaConectada.id}');

      return response.data['message'] as String;
    } on RestClientException catch (e, s) {
      log.error(e, s);
      if (e.statusCode == null || e.statusCode.toString() == 'null') {
        throw Failure(message: 'Erro de conexão com o servidor.');
      }
      log.error('Erro ao obter informações de conta conectada', e, s);
      throw Failure(message: e.message);
    }
  }
}
