import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void hideMessage({required BuildContext context}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void showMessage(
      {required BuildContext context,
      required String text,
      IconData? leadingIcon,
      VoidCallback? actionOnPressed,
      String? actionLabel,
      bool floating = true,
      double? marginBottom,
      Duration? customDuration,
      Color? backgroundColor}) {
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      // SnackBar(
      //           // margin: EdgeInsets.only(bottom: 80),
      //           // padding: const EdgeInsets.symmetric(horizontal: 16),
      //           margin: const EdgeInsets.only(bottom: 90, left: 16, right: 16),
      //           behavior: SnackBarBehavior.floating,
      //           showCloseIcon: true,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //           content: Text(state.errorMessage!),
      //           backgroundColor: context.secondaryColor,
      //         ),
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        content: Row(
          children: leadingIcon != null
              ? [
                  Icon(
                    leadingIcon,
                    color: context.primaryColor,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(color: context.primaryColor),
                    ),
                  ),
                ]
              : [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(color: context.primaryColor),
                    ),
                  ),
                ],
        ),
        action: actionLabel != null
            ? SnackBarAction(label: actionLabel, onPressed: () {})
            : null,
        behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        margin:
            EdgeInsets.only(bottom: marginBottom ?? 90, left: 16, right: 16),
        elevation: 10,
        showCloseIcon: true,
        backgroundColor: backgroundColor ?? context.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: customDuration ?? const Duration(milliseconds: 2500),
      ),
    );
  }
}
