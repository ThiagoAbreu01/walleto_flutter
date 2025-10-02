import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  static bool isOpen = false;

  void showLoader({String? message}) {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        barrierColor: context.primaryColor.withValues(alpha: 0.95),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async => false, // Prevent back button press
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingAnimationWidget.threeArchedCircle(
                  color: context.isDarkTheme
                      ? context.secondaryColor
                      : context.tertiaryColor,
                  size: 60,
                ),
                Visibility(
                  visible: message != null,
                  child: SizedBox(height: 20.w),
                ),
                message != null
                    ? Text(
                        message,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: context.isDarkTheme
                              ? context.secondaryColor
                              : context.tertiaryColor,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
