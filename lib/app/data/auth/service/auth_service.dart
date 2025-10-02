import 'package:walleto_flutter/app/core/helpers/constants.dart';

import '../../../core/exceptions/invalid_credentials_exception.dart';
import '../../../core/exceptions/user_did_not_accepted_politics_exception.dart';
import '../../../core/local_storage/secure_storage/secure_local_storage.dart';
import '../../../core/logger/logger.dart';
import '../repository/auth_repository.dart';
import '../../user/service/user_service.dart';
import '../../../../pages/register/view_models/register_view_model.dart';

import 'i_auth_service.dart';

class AuthService implements IAuthService {
  final AuthRepository authRepository;
  final UserService userService;
  final SecureLocalStorage secureLocalStorage;
  final Logger log;

  AuthService({
    required this.authRepository,
    required this.userService,
    required this.secureLocalStorage,
    required this.log,
  });

  @override
  Future<Map<String, String>?> fetchSecureLocalStorageLoginData() =>
      authRepository.fetchSecureLocalStorageLoginData();

  Future<void> validateCredentials(RegisterViewModel registerViewModel) async {
    if (registerViewModel.nome.isEmpty) {
      throw InvalidCredentialsException(
          message: 'Nome de usuário não pode ser vazio.');
    }

    if (registerViewModel.nome.endsWith(' ')) {
      registerViewModel.nome = registerViewModel.nome
          .substring(0, registerViewModel.nome.length - 1);
    }
    if (registerViewModel.nome.length < 3) {
      throw InvalidCredentialsException(
          message: 'Nome do usuário deve ter no mínimo 3 caracteres.');
    }
    if (registerViewModel.nome.length > 30) {
      throw InvalidCredentialsException(
          message: 'Nome do usuário deve ter no máximo 30 caracteres.');
    }
    if (registerViewModel.email.endsWith(' ')) {
      registerViewModel.email = registerViewModel.email
          .substring(0, registerViewModel.email.length - 1);
    }

    if (registerViewModel.email.isEmpty) {
      throw InvalidCredentialsException(
          message: 'O E-mail não pode ser vazio.');
    }

    if (registerViewModel.cpf.length < 11 || registerViewModel.cpf.length > 11) {
      throw InvalidCredentialsException(
          message: 'CPF inválido.');
    }
     if (registerViewModel.telefone.length < 10 || registerViewModel.telefone.length > 11) {
      throw InvalidCredentialsException(
          message: 'Telefone inválido.');
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(registerViewModel.email);
    bool emailIsValid2 = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
        .hasMatch(registerViewModel.email);
    if (!emailValid) {
      throw InvalidCredentialsException(message: 'E-mail inválido.');
    }
    if (!emailIsValid2) {
      throw InvalidCredentialsException(message: 'E-mail inválido.');
    }
    if (registerViewModel.email.isEmpty) {
      throw InvalidCredentialsException(
          message: 'Por favor, insira um E-mail.');
    }
    // if (PalavrasReservadas.contains(userModel.nome)) {
    //   visibility = true;
    //   return const Left(
    //       'Nome do usuário não pode ser uma palavra reservada do sistema.');
    // }

    if (registerViewModel.password.isEmpty) {
      throw InvalidCredentialsException(
          message: 'Por favor, insira uma senha.');
    }

    if (registerViewModel.password.length < 6) {
      throw InvalidCredentialsException(
          message: 'A senha deve conter no mínimo 6 caracteres.');
    }

    if (registerViewModel.password != registerViewModel.confirmPassword) {
      throw InvalidCredentialsException(
          message:
              'Falha na confirmação da senha. Por favor, confira os valores inseridos.');
    }

    // if (!registerViewModel.checkBoxIsChecked) {
    //   throw UserDidNotAcceptedPoliticsException(
    //       message: 'Por favor, aceite os termos de contrato para continuar.');
    // }
  }

  @override
  Future<void> register(RegisterViewModel registerViewModel) async {
    try {
      //! FirebaseAuth no longer being used.
      // final firebaseAuth = FirebaseAuth.instance;

      // final userMethods = await firebaseAuth
      //     .fetchSignInMethodsForEmail(registerViewModel.email);

      // if (userMethods.isNotEmpty) {
      //   throw UserExistsException(message: 'Usuário já existe com esse email.');
      // }

      await validateCredentials(registerViewModel);

      await authRepository.register(registerViewModel);
      // final userRegisteredCredential =
      // await firebaseAuth.createUserWithEmailAndPassword(
      // email: registerViewModel.email,
      // password: registerViewModel.password);

      // await userRegisteredCredential.user?.sendEmailVerification();
      // } on FirebaseException catch (e) {
      //   log.error(e.message);
      //   if (e.code == 'invalid-email') {
      //     throw InvalidEmailException(message: 'Email inválido.');
      //   } else if (e.code == 'weak-password') {
      //     throw WeakPasswordException(
      //         message: 'Sua senha deve conter pelo menos 6 dígitos.');
      //   } else if (e.code == 'email-already-in-use') {
      //     throw UserExistsException(
      //         message:
      //             'Este email já está em uso em nosso sistema, se você é o dono dessa conta, utilize o recurso "Esqueceu sua Senha" na página de Login.');
      //   }
      //   throw Failure(message: 'Houve um erro ao cadastrar usuário');
    } on UserDidNotAcceptedPoliticsException {
      rethrow;
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      String accessToken = await authRepository.login(email, password);
      _saveAccessToken(accessToken);
      await confirmLogin();

      final contaConectada = await userService.getContaConectada();

      await userService.saveLoggedUserModelInLocalStorage(contaConectada);
    } on InvalidCredentialsException {
      rethrow;
    }
  }

  @override
  Future<void> confirmLogin() async {
    final confirmLoginModel = await authRepository.confirmLogin();

    _saveRefreshToken(confirmLoginModel.refreshToken);
  }

  @override
  Future<void> saveDataToLocalStorage(String email, String password) =>
      authRepository.saveDataToLocalStorage(email, password);

  @override
  Future<void> sendEMailConfirmationCode(String email) =>
      authRepository.sendEMailConfirmationCode(email);

  @override
  Future<void> checkEMailConfirmationCode(String email, String code) =>
      authRepository.checkEMailConfirmationCode(email, code);

  Future<void> _saveAccessToken(String accessToken) async {
    await secureLocalStorage.write(
        Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
  }

  Future<void> _saveRefreshToken(String refreshToken) async {
    await secureLocalStorage.write(
        Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY, refreshToken);
  }

  @override
  Future<void> sendRecoveryEmail(String email) =>
      authRepository.sendRecoveryEmail(email);

  @override
  Future<void> checkRecoveryCode(String email, String code) =>
      authRepository.checkRecoveryCode(email, code);

  @override
  Future<void> changePassword(
          String email, String newPassword, String newPasswordConfirmation) =>
      authRepository.changePassword(
          email, newPassword, newPasswordConfirmation);
}
