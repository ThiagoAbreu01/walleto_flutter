import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:granio_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';
import 'dart:io' show Platform;

import 'package:granio_flutter/app/core/ui/styles/theme/custom_theme_switcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icon;

  final VoidCallback? onPressed;
  final double scrollOffset; //! Provided by a cubit
  // final VoidCallback openDrawer;
  final String title;
  final bool hasVoltar;
  final bool isDefault;
  final bool? isMobile; //! If true, the appbar will be displayed in a different way.
  final bool
      isGraphPage; //! If false, the icon will be automatically be the Icons.menu_rounded and the openDrawer function can be called.
  final Color? backgroundColor;
  final Color? textAndIconColor;
  final double? fontSize;

  final BuildContext context;

  const CustomAppBar({
    super.key,
    this.icon,
    this.onPressed,
    this.scrollOffset = 0.0,
    this.backgroundColor,
    this.textAndIconColor,
    this.fontSize,
    // required this.openDrawer,
    required this.title,
    required this.hasVoltar,
    required this.isDefault,
    this.isMobile,
    required this.isGraphPage,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (kIsWeb) {
      return SafeArea(
        child: Container(
          width: screenSize.width,
          height: 60,
          color: backgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 60,
              //   height: 60,
              //   child: Material(
              //     borderRadius: BorderRadius.circular(32),
              //     color: Colors.transparent,
              //     child: InkWell(
              //       splashColor: context.primaryColor,
              //       borderRadius: BorderRadius.circular(32),
              //       onTap: onPressed != null
              //           ? onPressed ?? onPressed
              //           : isGraphPage
              //               ? () => Navigator.pop(context)
              //               : openDrawer,
              //       child: Center(
              //         child: FaIcon(
              //           icon ??
              //               (isGraphPage
              //                   ? Icons.arrow_back
              //                   : Icons.menu_rounded),
              //           size: 40,
              //           color: textAndIconColor ??
              //               (isDefault
              //                   ? context.primaryColor
              //                   : scrollOffset > 30
              //                       ? context.primaryColor.withValues(alpha:
              //                           (scrollOffset / 400)
              //                               .clamp(0, 1)
              //                               .toDouble())
              //                       : context.tertiaryColor),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 55,
                width: screenSize.width * 0.6,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 18,
                      fontWeight: FontWeight.bold,
                      color: textAndIconColor,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Builder(builder: (context) {
                return SizedBox(
                  width: screenSize.width * 0.2,
                  height: 55,
                  child: scrollOffset < 30
                      ? isDefault
                          ? CustomThemeSwitcher.themeType.brightness ==
                                  Brightness.dark
                              ? Image.asset(
                                  'assets/images/logo_solpi_fundo_transparente.png')
                              : Image.asset(
                                  'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png')
                          : CustomThemeSwitcher.themeType.brightness ==
                                  Brightness.dark
                              ? Image.asset(
                                  'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png')
                              : Image.asset(
                                  'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png')
                      : context.isDarkTheme
                          ? Image.asset(
                              'assets/logo/Default/ConstruDesk_Long_black_fundo_transparente.png')
                          : Image.asset(
                              'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png'),
                );
              }),
            ],
          ),
        ),
      );
    } else {
      if (Platform.isIOS) {
        return Container(
          width: screenSize.width,
          height: kToolbarHeight * 1.45,
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          color: backgroundColor ??
              (isDefault
                  ? context.isDarkTheme
                      ? context.secondaryColor
                      : context.tertiaryColor
                  : context.isDarkTheme
                      ? context.secondaryColor.withValues(
                          alpha: (scrollOffset / 350).clamp(0, 1).toDouble())
                      : context.tertiaryColor.withValues(
                          alpha: (scrollOffset / 350).clamp(0, 1).toDouble())),
          // color: Colors.black,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(
              //   width: 60,
              //   height: 60,
              //   child: Material(
              //     borderRadius: BorderRadius.circular(32),
              //     color: Colors.transparent,
              //     child: InkWell(
              //       splashColor: context.primaryColor,
              //       borderRadius: BorderRadius.circular(32),
              //       onTap: onPressed != null
              //           ? onPressed ?? onPressed
              //           : isGraphPage
              //               ? () => Navigator.pop(context)
              //               : openDrawer,
              //       child: Center(
              //         child: FaIcon(
              //           icon ??
              //               (isGraphPage
              //                   ? Icons.arrow_back
              //                   : Icons.menu_rounded),
              //           size: 40,
              //           color: textAndIconColor ??
              //               (isDefault
              //                   ? context.primaryColor
              //                   : scrollOffset > 30
              //                       ? CustomThemeSwitcher
              //                                   .themeType.brightness ==
              //                               Brightness.dark
              //                           ? context.primaryColor.withValues(alpha:
              //                               (scrollOffset / 350)
              //                                   .clamp(0, 1)
              //                                   .toDouble())
              //                           : context.primaryColor
              //                       : CustomThemeSwitcher
              //                                   .themeType.brightness ==
              //                               Brightness.dark
              //                           ? context.tertiaryColor
              //                           : context.primaryColor),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(width: screenSize.width * 0.01),
              SizedBox(
                height: 55,
                width: screenSize.width * 0.6,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 18,
                      fontWeight: FontWeight.bold,
                      color: textAndIconColor ??
                          (isDefault
                              ? context.primaryColor
                              : scrollOffset > 30
                                  ? CustomThemeSwitcher.themeType.brightness ==
                                          Brightness.dark
                                      ? context.primaryColor.withValues(
                                          alpha: (scrollOffset / 350)
                                              .clamp(0, 1)
                                              .toDouble())
                                      : context.primaryColor
                                  : CustomThemeSwitcher.themeType.brightness ==
                                          Brightness.dark
                                      ? context.tertiaryColor
                                      : context.primaryColor),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Builder(builder: (context) {
                return SizedBox(
                  width: screenSize.width * 0.22,
                  height: 55,
                  child: scrollOffset < 30
                      ? isDefault
                          ? CustomThemeSwitcher.themeType.brightness ==
                                  Brightness.dark
                              ? Image.asset(
                                  'assets/images/logo_solpi_fundo_transparente.png')
                              : Image.asset(
                                  'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png')
                          : CustomThemeSwitcher.themeType.brightness ==
                                  Brightness.dark
                              ? Image.asset(
                                  'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png')
                              : Image.asset(
                                  'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png')
                      : context.isDarkTheme
                          ? Image.asset(
                              'assets/logo/Default/ConstruDesk_Long_black_fundo_transparente.png')
                          : Image.asset(
                              'assets/logo/Default/ConstruDesk_Long_fundo_transparente.png'),
                );
              }),
            ],
          ),
        );
      } else {
        return SafeArea(
          child: Container(
            width: screenSize.width,
            height: 68,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            color: backgroundColor ??
                backgroundColor ??
                (isDefault
                    ? context.isDarkTheme
                        ? context.secondaryColor
                        : context.tertiaryColor
                    : context.isDarkTheme
                        ? context.secondaryColor.withValues(
                            alpha: (scrollOffset / 350).clamp(0, 1).toDouble())
                        : context.tertiaryColor.withValues(
                            alpha:
                                (scrollOffset / 350).clamp(0, 1).toDouble())),
            // color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 10,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    hasVoltar
                        ? SizedBox(
                            width: 60,
                            height: 55,
                            child: Material(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: context.tertiaryContainer,
                                borderRadius: BorderRadius.circular(40),
                                onTap: onPressed ??
                                    () {
                                      Navigator.pop(context);
                                    },
                                child: Center(
                                  child: icon != null
                                      ? FaIcon(
                                          icon,
                                          size: 40,
                                          color: textAndIconColor ??
                                              (isDefault
                                                  ? context.primaryColor
                                                  : scrollOffset > 30
                                                      ? CustomThemeSwitcher
                                                                  .themeType
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? context.primaryColor
                                                              .withValues(
                                                                  alpha: (scrollOffset /
                                                                          350)
                                                                      .clamp(
                                                                          0, 1)
                                                                      .toDouble())
                                                          : context.primaryColor
                                                      : CustomThemeSwitcher
                                                                  .themeType
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? context
                                                              .tertiaryColor
                                                          : context
                                                              .primaryColor),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: isMobile == true ? 20 : 120,
                            height: 50,
                          ),
                    hasVoltar
                        ? const SizedBox(width: 15)
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: 55,
                      width: context.percentWidth(0.5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: fontSize ?? 18,
                            fontWeight: FontWeight.bold,
                            color: textAndIconColor ??
                                (isDefault
                                    ? context.primaryColor
                                    : scrollOffset > 30
                                        ? CustomThemeSwitcher
                                                    .themeType.brightness ==
                                                Brightness.dark
                                            ? context.primaryColor.withValues(
                                                alpha: (scrollOffset / 350)
                                                    .clamp(0, 1)
                                                    .toDouble())
                                            : context.primaryColor
                                        : CustomThemeSwitcher
                                                    .themeType.brightness ==
                                                Brightness.dark
                                            ? context.tertiaryColor
                                            : context.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Builder(builder: (context) {
                      return Row(
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.2,
                            height: 55,
                            child: scrollOffset < 30
                                ? isDefault
                                    ? CustomThemeSwitcher
                                                .themeType.brightness ==
                                            Brightness.dark
                                        ? Image.asset(
                                            'assets/images/logo_solpi_fundo_transparente.png')
                                        : Image.asset(
                                            'assets/images/logo_solpi_fundo_transparente.png')
                                    : CustomThemeSwitcher
                                                .themeType.brightness ==
                                            Brightness.dark
                                        ? Image.asset(
                                            'assets/images/logo_solpi_fundo_transparente.png')
                                        : Image.asset(
                                            'assets/images/logo_solpi_fundo_transparente.png')
                                : context.isDarkTheme
                                    ? Image.asset(
                                        'assets/images/logo_solpi_fundo_transparente.png')
                                    : Image.asset(
                                        'assets/images/logo_solpi_fundo_transparente.png'),
                          ),
                          const SizedBox(width: 15)
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Size get preferredSize => Size(context.width, 60.0.w);
}
