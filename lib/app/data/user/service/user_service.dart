// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:walleto_flutter/app/core/helpers/constants.dart';
import 'package:walleto_flutter/app/core/local_storage/secure_storage/secure_local_storage.dart';
import 'package:walleto_flutter/app/core/logger/logger.dart';
import 'package:walleto_flutter/app/data/user/repository/user_repository.dart';
import 'package:walleto_flutter/app/data/user/service/i_user_service.dart';
import 'package:walleto_flutter/app/models/logged_user_model.dart';

class UserService implements IUserService {
  final UserRepository userRepository;
  final Logger log;
  final SecureLocalStorage secureLocalStorage;

  UserService({
    required this.userRepository,
    required this.log,
    required this.secureLocalStorage,
  });

  @override
  Future<LoggedUserModel> getContaConectada() async {
    LoggedUserModel contaConectada = await userRepository.getContaConectada();
    await saveLoggedUserModelInLocalStorage(contaConectada);
    return contaConectada;
  }

  @override
  Future<LoggedUserModel> updateProfileImage(File file, int userID) =>
      userRepository.updateProfileImage(file, userID);

  Future<void> saveLoggedUserModelInLocalStorage(
      LoggedUserModel contaConectada) async {
    await secureLocalStorage.write(
        Constants.LOCAL_STORE_LOGGED_USER_MODEL, contaConectada.toJson());
  }

  Future<LoggedUserModel?> findLoggedUserModelInLocalStorage() async {
    var jsonData =
        await secureLocalStorage.read(Constants.LOCAL_STORE_LOGGED_USER_MODEL);

    if (jsonData != null) {
      return LoggedUserModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
  @override
  Future<String> deleteAccount(LoggedUserModel  contaConectada) =>
      userRepository.deleteAccount(contaConectada);
}
