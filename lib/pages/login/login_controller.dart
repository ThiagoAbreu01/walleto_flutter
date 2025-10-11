import 'dart:async';

import 'package:granio_flutter/app/core/exceptions/no_credential_saved_in_local_storage_exception.dart';

import '../../app/core/config/env/env.dart';
import '../../app/core/exceptions/failure.dart';
import '../../app/core/exceptions/finger_print_exception.dart';
import '../../app/core/exceptions/invalid_credentials_exception.dart';
import '../../app/core/exceptions/wrong_app_version_exception.dart';
import '../../app/core/helpers/constants.dart';
import '../../app/core/helpers/set_screen_mode.dart';
import '../../app/core/local_storage/secure_storage/secure_local_storage.dart';
import '../../app/core/logger/logger.dart';
import '../../app/data/auth/service/auth_service.dart';
import '../../app/data/user/service/user_service.dart';
import '../../app/models/login_local_data_model.dart';
import 'finger_print_service/finger_print_service.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService authService;
  final UserService userService;
  final FingerPrintService fingerPrintService;
  final Logger log;
  final SecureLocalStorage secureLocalStorage;
  LoginController({
    required this.authService,
    required this.userService,
    required this.fingerPrintService,
    required this.log,
    required this.secureLocalStorage,
  }) : super(LoginState(
          status: LoginStatus.pre_request,
        ));

  Future<LoginLocalCredentials?> findCredentialsFromSecureLocalStorage() async {
    try {
      final String? email;
      final String? password;
      email = await secureLocalStorage.read('email');

      if (email == null) {
        return null;
      }
      password = await secureLocalStorage.read('password');
      // emit(state.copyWith(loginEmail: email, loginSenha: password));
      return LoginLocalCredentials(email: email, password: password!);
    } catch (e) {
      //!
      return null;
    }
  }

  Future<void> getAppVersion() async {
    final localAppVersion = Env.i[Constants.APP_VERSION] ?? '';

    // CustomRemoteConfig().forceFetch();
    // final remoteAppVersion = CustomRemoteConfig()
    //     .getValueOrDefault(key: 'app_version', defaultValue: '');

    emit(
      state.copyWith(
        localAppVersion: localAppVersion,
        remoteAppVersion: '1.0',
      ),
    );
  }

  Future<void> login(String email, String password,
      bool shouldSaveInSecureLocalStorage) async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await authService.login(email, password);

      if (shouldSaveInSecureLocalStorage) {
        await authService.saveDataToLocalStorage(email, password);
      }

      final loggedUserModel =
          await userService.findLoggedUserModelInLocalStorage();

      emit(state.copyWith(
          status: LoginStatus.initial, loggedUserModel: loggedUserModel));
    } on InvalidCredentialsException catch (e, s) {
      emit(
        state.copyWith(
          status: LoginStatus.initial,
          errorMessage: e.message,
        ),
      );
      log.error(e.message, s);
    } on WrongAppVersionException catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.initial,
          errorMessage: e.message,
        ),
      );
    } on Failure catch (e, s) {
      emit(
        state.copyWith(
          status: LoginStatus.initial,
          errorMessage: e.message,
        ),
      );
      log.error(e.message, s);
    }
  }

  void setInitialState() {
    emit(
      state.copyWith(
        status: LoginStatus.initial,
        counterIsActive: false,
        remainingTime: 0,
        errorMessage: null,
      ),
    );
  }

  Future<void> requestFingerPrintAuthentication(
      {required bool isFromInitState}) async {
    bool counterIsActive = false;
    int remainingTime = 0;

    emit(
      state.copyWith(
        status: LoginStatus.initial,
        counterIsActive: false,
        remainingTime: 0,
        errorMessage: null,
      ),
    );
    try {
      SetScreenMode.fullScreen();

      LoginLocalCredentials? credentials =
          await findCredentialsFromSecureLocalStorage();
      if (credentials == null && !isFromInitState) {
        //! In this case, this method is being called from FloatingActionButton
        throw NoCredentialSavedInLocalStorageException(
            message:
                'Você precisa ter as credenciais salvas no último login para utilizar a autenticação por biometria...');
      } else if (credentials == null && isFromInitState) {
        //! if this method is being called from InitState/AddPostFrameCallback, then it shouldn't display any error message.
        return;
      }

      bool myFingerPrintResult = await FingerPrintService.authenticate();
      SetScreenMode.fullScreen();

      if (myFingerPrintResult == false) {
        //! If user cancelled the FingerPrintService on Purpose (or not).
        emit(
          state.copyWith(
            status: LoginStatus.initial,
            counterIsActive: false,
            remainingTime: 0,
            errorMessage: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
              status: LoginStatus.loading,
              loginEmail: credentials!.email,
              loginSenha: credentials.password),
        );
        await login(credentials.email, credentials.password, false);

        emit(
          state.copyWith(
            status: LoginStatus.initial,
            counterIsActive: false,
            remainingTime: 0,
            errorMessage: null,
          ),
        );

        //! Succesfully FingerPrint Authenticated, Should Trigger the Repository.Auth,
        //! And if Repository.Auth fails, go back to LoginStatus.initial (only if the LoginStatus.waiting counter is inactive, otherwise,
        //! Goes back to LoginStatus.waiting to show the Counter)
      }
    } on FingerPrintException catch (e) {
      //! This error means that it FingerPrintService tried 5 times to read user Fingerprint but his fingerprint failed,
      //! Should Trigger the 30s timer and then start back to loading.
      //! Good to know => There's a bool variable who should say if counter is active,
      //! because if user tries to login w/ email and password and it fails, should not go back to LoginStatus.initial, and need to go to
      //! LoginStatus.loading as it was before, putting back the counter.
      if (e.message != 'Authentication in progress') {
        counterIsActive = true;
        remainingTime = 30;
        emit(
          state.copyWith(
            status: LoginStatus.waiting,
            counterIsActive: counterIsActive,
            remainingTime: remainingTime,
            errorMessage: e.message,
          ),
        );
      }

      Timer.periodic(const Duration(seconds: 1), (timer) {
        remainingTime--;
        if (remainingTime <= 0) {
          timer.cancel();
          emit(state.copyWith(
              status: LoginStatus.initial,
              counterIsActive: false,
              remainingTime: 0,
              errorMessage: null));
        } else {
          emit(state.copyWith(
              status: LoginStatus.waiting,
              counterIsActive: counterIsActive,
              remainingTime: remainingTime,
              errorMessage: e.message.toString()));
        }
      });
    } on NoCredentialSavedInLocalStorageException catch (e) {
      emit(
          state.copyWith(status: LoginStatus.initial, errorMessage: e.message));
    } on MissingPluginException catch (e) {
      emit(
          state.copyWith(status: LoginStatus.initial, errorMessage: e.message));
    } on Exception catch (e) {
      emit(state.copyWith(
          status: LoginStatus.initial, errorMessage: e.toString()));
    }
  }

  Future<void> setFirstLoginDone() async {
    await secureLocalStorage.write('isFirstLogin', 'false');
  }

  Future<bool> isFirstLogin() async {
    bool isFirstLogin = !(await secureLocalStorage.contains('isFirstLogin'));

    //! If already contains, then, it's not the first login

    if (isFirstLogin) {
      await setFirstLoginDone();
      return true;
    } else {
      return false;
    }
  }
}
