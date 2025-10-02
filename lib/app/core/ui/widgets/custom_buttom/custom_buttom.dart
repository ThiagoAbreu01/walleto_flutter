import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
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
  final String? label;
  final Color? labelColor;
  final Color? splashColor;
  final List<BoxShadow>? boxShadow;
  final Duration? animationDuration;
  final BoxBorder? border;
  final double? fontSize;


  const CustomButton({
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
    this.label,
    this.labelColor,
    this.splashColor,
    this.boxShadow,
    this.animationDuration,
    this.border,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration ?? const Duration(milliseconds: 500),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0),
        boxShadow: boxShadow ?? [],
        borderRadius: borderRadius ?? BorderRadius.circular(32),
        border: border ?? Border.all(
          color: context.isDarkTheme
              ? context.secondaryColor
              : context.tertiaryColor,
          width: 1,
        ),
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
            child: Builder(
              builder: (context) {
                if ((icon != null) == true) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      useImageAsIcon
                          ? ImageIcon(
                              AssetImage(imageIconPath!),
                              color: iconColor ?? context.primaryColor,
                              size: iconSize ?? 25,
                            )
                          : Center(
                              child: Icon(
                                icon,
                                color: iconColor ?? context.primaryColor,
                                size: iconSize ?? 25,
                              ),
                            ),
                      const SizedBox(width: 20),
                      label != null
                          ? Text(
                              label!,
                              style: TextStyle(
                                color: labelColor ?? context.primaryColor,
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          : const SizedBox.shrink(),
                      const Spacer(),
                    ],
                  );
                } else if (icon == null && useImageAsIcon) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      useImageAsIcon
                          ? ImageIcon(
                              AssetImage(imageIconPath!),
                              color: iconColor ?? context.primaryColor,
                              size: iconSize ?? 25,
                            )
                          : Center(
                              child: Icon(
                                icon,
                                color: iconColor ?? context.primaryColor,
                                size: iconSize ?? 25,
                              ),
                            ),
                      const SizedBox(width: 20),
                      label != null
                          ? Text(
                              label!,
                              style: TextStyle(
                                color: labelColor ?? context.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          : const SizedBox.shrink(),
                      const Spacer(),
                    ],
                  );
                } else if (icon == null && !useImageAsIcon) {
                  return label != null
                      ? Center(
                          child: Text(
                            label!,
                            style: TextStyle(
                              color: labelColor ?? context.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : const SizedBox.shrink();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
