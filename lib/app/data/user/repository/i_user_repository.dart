import '../../../models/logged_user_model.dart';
import 'dart:io';

abstract class IUserRepository {
  Future<LoggedUserModel> getContaConectada();
  Future<LoggedUserModel> updateProfileImage(File file, int userID);
  Future<String> deleteAccount(LoggedUserModel contaConectada);
}
