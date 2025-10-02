import 'package:flutter/material.dart';

class LightThemeColors {
  static LightThemeColors? _instance;

  LightThemeColors._();

  static LightThemeColors get i {
    _instance ??= LightThemeColors._();
    return _instance!;
  }

  //! Light:
  Color get primary => const Color.fromARGB(255, 255, 255, 255); //! #ffffff
  // Color get secondary => const Color.fromRGBO(254, 199, 5, 1); //! #fec805
  Color get secondary => const Color.fromARGB(255, 64, 191, 223); //! #fec805

  Color get tertiary => const Color.fromARGB(255, 10, 10, 10); //! #08080c
  Color get backgroundGrey => Colors.white; //! #17171b
  Color get shadowColor => Colors.grey[600]!;

  Color get darkGreen => const Color.fromARGB(255, 12, 170, 6);
  Color get lightGreen => const Color.fromARGB(255, 8, 229, 0);
  Color get red => const Color.fromARGB(255, 194, 0, 0);
  // Color get backgroundGrey => const Color.fromRGBO(35, 35, 35, 1);
  Color get transparent => const Color.fromARGB(0, 0, 0, 0);
}
