import 'package:flutter/material.dart';
import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';

class CustomDialog {
  CustomDialog._();

  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String message,
    required String title,
    bool? useRootNavigator,
    TextStyle? messageStyle,
    TextStyle? titleStyle,
    String? cancelarLabel,
    String? confirmarLabel,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? buttonColor,
    Color? buttonTextColor,
    Function()? onCancelarPressed,
    Function()? onConfirmarPressed,
  }) async {
    return (await showAdaptiveDialog(
          context: context,
          useRootNavigator: useRootNavigator ?? false,
          builder: (dialogContext) {
            return AlertDialog.adaptive(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: context.isDarkTheme
                  ? context.primaryColor
                  : context.tertiaryColor,
              title: Text(title, style: titleStyle),
              content: Text(
                  // 'Deseja sair do processo de recuperação de senha?',
                  message,
                  style: messageStyle
                  // TextStyle(color: context.tertiaryColor),
                  ),
              actions: [
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateColor.resolveWith(
                      (states) => context.isDarkTheme
                          ? context.tertiaryContainer.withValues(alpha: 0.5)
                          : context.primaryColor,
                    ),
                    backgroundColor: WidgetStateColor.resolveWith(
                      (states) => context.isDarkTheme
                          ? context.primaryColor
                          : context.tertiaryColor,
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: context.isDarkTheme
                              ? context.tertiaryColor
                              : context.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  onPressed: onCancelarPressed ??
                      () => Navigator.pop(dialogContext, false),
                  child: Text(
                    cancelarLabel ?? 'Não',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: context.isDarkTheme
                          ? context.tertiaryColor
                          : context.secondaryColor,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateColor.resolveWith(
                      (states) => context.isDarkTheme
                          ? context.tertiaryContainer.withValues(alpha: 0.5)
                          : context.primaryColor,
                    ),
                    backgroundColor: WidgetStateColor.resolveWith(
                      (states) => context.isDarkTheme
                          ? context.primaryColor
                          : context.tertiaryColor,
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: context.isDarkTheme
                              ? context.tertiaryColor
                              : context.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  onPressed:
                      onConfirmarPressed ?? () => Navigator.pop(context, true),
                  child: Text(
                    confirmarLabel ?? 'Sim',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: context.isDarkTheme
                          ? context.tertiaryColor
                          : context.tertiaryColor,
                    ),
                  ),
                ),
              ],
            );
          },
        )) ??
        false;
  }

  static Future<bool> showCustomDialog({
    required BuildContext context,
    required Widget body,
    required String title,
    TextStyle? titleStyle,
    required List<Widget>? actions,
    bool? barrierDismissible,
    bool? useRootNavigator,
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    Color? buttonColor,
    Color? buttonTextColor,
    bool? tittleCenter = false,
  }) async {
    return (await showAdaptiveDialog(
          context: context,
          useRootNavigator: useRootNavigator ?? false,
          barrierDismissible: barrierDismissible ?? false,
          builder: (context) {
            return SizedBox(
              height: 200,
              child: AlertDialog.adaptive(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                backgroundColor: backgroundColor ?? context.primaryColor,
                title: tittleCenter == true
                    ? Center(
                        child: Text(
                          title,
                          style: titleStyle ?? TextStyle(color: titleColor),
                        ),
                      )
                    : Text(
                        title,
                        style: titleStyle ??
                            TextStyle(color: context.tertiaryColor),
                      ),
                content: body,
                actions: actions,
              ),
            );
          },
        )) ??
        false;
  }
}
