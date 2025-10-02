import '../../../../pages/register/view_models/register_view_model.dart';

abstract class IAuthService {
  Future<Map<String, String>?> fetchSecureLocalStorageLoginData();
  Future<void> saveDataToLocalStorage(String email, String password);
  Future<void> register(RegisterViewModel registerViewModel);
  Future<void> login(String email, String password);
  Future<void> confirmLogin();
  Future<void> sendEMailConfirmationCode(String email);
  Future<void> checkEMailConfirmationCode(String email, String code);
  Future<void> sendRecoveryEmail(String email);
  Future<void> checkRecoveryCode(String email, String code);
  Future<void> changePassword(
      String email, String newPassword, String newPasswordConfirmation);
}
