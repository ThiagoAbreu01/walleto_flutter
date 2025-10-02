import 'package:walleto_flutter/app/core/local_storage/secure_storage/secure_local_storage.dart';
import 'package:walleto_flutter/app/core/ui/styles/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomThemeSwitcher {
  static ThemeData get themeType => themeNotifier.value;

  static Future<void> initializeTheme() async {
    try {
      final SecureLocalStorage secureStorage = SecureLocalStorage();
      String themeValue = await secureStorage.read('Theme') ?? 'Dark';

      if (themeValue == 'Light') {
        themeNotifier.value = AppLightTheme.data;
      } else {
        themeNotifier.value = AppDarkTheme.data;
      }
    } on PlatformException {
      themeNotifier.value = AppDarkTheme.data;
    }
  }

  static ValueNotifier<ThemeData> themeNotifier =
      ValueNotifier<ThemeData>(AppDarkTheme.data);

  static void switchToDarkTheme() async {
    final SecureLocalStorage secureStorage = SecureLocalStorage();

    await secureStorage.write('Theme', 'Dark');
    themeNotifier.value = AppDarkTheme.data;
  }

  static void switchToLightTheme() async {
    final SecureLocalStorage secureStorage = SecureLocalStorage();

    await secureStorage.write('Theme', 'Light');
    themeNotifier.value = AppLightTheme.data;
  }
}
