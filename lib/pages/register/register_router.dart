import '../../app/data/auth/repository/auth_repository.dart';
import '../../app/data/auth/service/auth_service.dart';
import '../../app/data/user/repository/user_repository.dart';
import '../../app/data/user/service/user_service.dart';
import 'register_controller.dart';
import 'register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<UserRepository>(
            create: (context) => UserRepository(
              dio: context.read(),
              log: context.read(),
            ),
          ),
          Provider<UserService>(
            create: (context) => UserService(
              userRepository: context.read(),
              log: context.read(),
              secureLocalStorage: context.read(),
            ),
          ),
          Provider<AuthRepository>(
            create: (context) => AuthRepository(
              dio: context.read(),
              log: context.read(),
              secureLocalStorage: context.read(),
            ),
          ),
          Provider<AuthService>(
            create: (context) => AuthService(
              authRepository: context.read(),
              userService: context.read(),
              log: context.read(),
              secureLocalStorage: context.read(),
            ),
          ),
          Provider<RegisterController>(
            create: (context) => RegisterController(
              authService: context.read(),
              log: context.read(),
            ),
          ),
        ],
        child: const RegisterPage(),
      );
}
