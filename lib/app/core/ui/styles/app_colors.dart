import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  //! Dark (Original):
  Color get darkPrimary => const Color.fromRGBO(8, 8, 12, 1); //! #08080c
  Color get darkSecondary => const Color.fromARGB(255, 218, 98, 1); //! #fec805
  Color get darkTertiary => const Color.fromARGB(255, 59, 219, 240); //! #ffffff
  Color get darkBackgroundGrey =>
      const Color.fromRGBO(23, 23, 27, 1); //! #17171b
  Color get darkShadowColor => const Color.fromRGBO(0, 0, 0, 1); //! #000000
  //! Light:
  Color get lightTertiary => const Color.fromRGBO(8, 8, 12, 1); //! #08080c
  Color get lightSecondary => const Color.fromRGBO(254, 199, 5, 1); //! #fec805
  Color get lightPrimary => const Color.fromRGBO(255, 255, 255, 1); //! #ffffff
  Color get lightBackgroundGrey => Colors.grey[500]!; //! #
  Color get lightShadowColor => Colors.grey[600]!;

  Color get darkGreen => const Color.fromARGB(255, 12, 170, 6);
  Color get lightGreen => const Color.fromARGB(255, 8, 229, 0);
  Color get red => const Color.fromARGB(255, 194, 0, 0);
  // Color get backgroundGrey => const Color.fromRGBO(35, 35, 35, 1);
  Color get transparent => const Color.fromARGB(0, 0, 0, 0);
}

extension ColorAppExtension on BuildContext {
  AppColors get colors => AppColors.i;
}
