import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:granio_flutter/app/core/ui/extensions/size_screen_extension.dart';

class CustomIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final bool useImageAsIcon;
  final String? imageIconPath;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? labelColor;
  final List<BoxShadow>? boxShadow;
  final Color? splashColor;
  final EdgeInsets? iconPadding;
  const CustomIconButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    required this.onTap,
    required this.useImageAsIcon,
    this.imageIconPath,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.labelColor,
    this.boxShadow,
    this.splashColor,
    this.iconPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0),
        boxShadow: boxShadow ?? [],
        borderRadius: borderRadius ?? BorderRadius.circular(32),
      ),
      child: Material(
        borderRadius: borderRadius ?? BorderRadius.circular(32),
        color: backgroundColor ?? context.secondaryColor,
        child: InkWell(
          splashColor: splashColor ?? context.primaryColor,
          customBorder: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(32),
          ),
          onTap: onTap,
          child: Container(
            width: width ?? 180.w,
            height: height ?? 50.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: borderRadius ?? BorderRadius.circular(32),
              // boxShadow: boxShadow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                useImageAsIcon
                    ? ImageIcon(
                        AssetImage(imageIconPath!),
                        color: iconColor ?? context.primaryColor,
                        size: iconSize ?? 25,
                      )
                    : Padding(
                        padding: iconPadding ?? const EdgeInsets.all(0.0),
                        child: Icon(
                          icon,
                          color: iconColor ??
                              (context.isDarkTheme
                                  ? context.primaryColor
                                  : context.secondaryColor),
                          size: iconSize ?? 25,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
