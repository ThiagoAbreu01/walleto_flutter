import 'package:walleto_flutter/app/models/confirm_login_model.dart';
import 'package:walleto_flutter/pages/register/view_models/register_view_model.dart';

abstract class IAuthRepository {
  Future<Map<String, String>?> fetchSecureLocalStorageLoginData();
  Future<void> saveDataToLocalStorage(String email, String password);
  Future<void> register(RegisterViewModel registerViewModel);
  Future<String> login(String email, String password);
  Future<ConfirmLogin> confirmLogin();
  // Future<void> getUserDataByToken();
  Future<void> sendEMailConfirmationCode(String email);
  Future<void> checkEMailConfirmationCode(String email, String code);
  Future<void> sendRecoveryEmail(String email);
  Future<void> checkRecoveryCode(String email, String code);
  Future<void> changePassword(
      String email, String newPassword, String newPasswordConfirmation);
}
