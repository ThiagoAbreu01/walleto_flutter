import 'package:walleto_flutter/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'mplus1';
  //! Não estou usando a mplus1 no momento. pode ser substituída por outra no futuro.
  // TextStyle get textLight =>
  //     TextStyle(fontWeight: FontWeight.w300, fontFamily: font);
  TextStyle get textLight =>
      TextStyle(color: AppColors.i.darkTertiary, fontWeight: FontWeight.w300);
  TextStyle get textRegular =>
      TextStyle(color: AppColors.i.darkTertiary, fontWeight: FontWeight.normal);
  TextStyle get textMedium =>
      TextStyle(color: AppColors.i.darkTertiary, fontWeight: FontWeight.w500);
  TextStyle get textSemiBold =>
      TextStyle(color: AppColors.i.darkTertiary, fontWeight: FontWeight.w600);
  TextStyle get textBold =>
      TextStyle(color: AppColors.i.darkTertiary, fontWeight: FontWeight.w700);
  TextStyle get textExtraBold =>
      TextStyle(color: AppColors.i.darkTertiary, fontWeight: FontWeight.w800);

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
  TextStyle get textFieldLabel => textMedium.copyWith(
        fontSize: 10,
        color: Colors.grey[400],
      );

  TextStyle get linkStyle =>
      textBold.copyWith(color: Colors.blue, fontSize: 13);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
