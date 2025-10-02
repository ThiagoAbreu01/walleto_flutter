import 'package:flutter/material.dart';

class DarkThemeColors {
  static DarkThemeColors? _instance;

  DarkThemeColors._();

  static DarkThemeColors get i {
    _instance ??= DarkThemeColors._();
    return _instance!;
  }

  //! Dark:
  Color get primary => const Color.fromARGB(255, 52, 53, 58); //! #08080c
  // Color get secondary => const Color.fromRGBO(254, 199, 5, 1); //! #fec805
  Color get secondary => const Color.fromARGB(255, 37, 192, 240); //! #fec805
  Color get tertiary => const Color.fromRGBO(255, 255, 255, 1); //! #ffffff
  Color get backgroundGrey => const Color.fromARGB(255, 0, 0, 0); //! #17171b
  Color get shadowColor => const Color.fromRGBO(0, 0, 0, 1); //! #17171b

  Color get darkGreen => const Color.fromARGB(255, 12, 170, 6);
  Color get lightGreen => const Color.fromARGB(255, 8, 229, 0);
  Color get red => const Color.fromARGB(255, 194, 0, 0);
  // Color get backgroundGrey => const Color.fromRGBO(35, 35, 35, 1);
  Color get transparent => const Color.fromARGB(0, 0, 0, 0);
}
