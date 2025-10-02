import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/core/local_storage/secure_storage/secure_local_storage.dart';
import '../../app/data/auth/repository/auth_repository.dart';
import '../../app/data/auth/service/auth_service.dart';
import '../../app/data/user/repository/user_repository.dart';
import '../../app/data/user/service/user_service.dart';
import 'finger_print_service/finger_print_service.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<SecureLocalStorage>(
              create: (context) => SecureLocalStorage()),
          Provider<FingerPrintService>(
              create: (context) => FingerPrintService()),
          Provider<UserRepository>(
            create: (context) => UserRepository(
              dio: context.read(),
              log: context.read(),
            ),
          ),
          Provider(
            create: (context) => UserService(
              userRepository: context.read(),
              log: context.read(),
              secureLocalStorage: context.read(),
            ),
          ),
          Provider<AuthRepository>(
            create: (context) => AuthRepository(
              dio: context.read(),
              secureLocalStorage: context.read(),
              log: context.read(),
            ),
          ),
          Provider(
            create: (context) => AuthService(
              authRepository: context.read(),
              userService: context.read(),
              secureLocalStorage: context.read(),
              log: context.read(),
            ),
          ),
          Provider<LoginController>(
            create: (context) => LoginController(
              authService: context.read(),
              userService: context.read(),
              fingerPrintService: context.read(),
              log: context.read(),
              secureLocalStorage: context.read(),
            ),
          ),
        ],
        child: const LoginPage(),
      );
}
