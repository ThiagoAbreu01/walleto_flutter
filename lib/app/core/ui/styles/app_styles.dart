import 'package:granio_flutter/app/core/ui/styles/app_colors.dart';
import 'package:granio_flutter/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: AppColors.i.darkPrimary,
        textStyle: TextStyles.i.textButtonLabel,
      );
}

extension AppStyleExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
