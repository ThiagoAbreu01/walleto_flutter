import 'package:flutter/material.dart';
import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:walleto_flutter/app/core/ui/widgets/global_components/custom_box_shadow.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final List<IconData> listaIcons;
  final Function(int newIndex) onTap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.listaIcons,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // CustomThemeSwitcher.switchToDarkTheme();

    assert(widget.listaIcons.length >= 2 && widget.listaIcons.length <= 5,
        'Insira pelo menos 2 ícones');

    switch (widget.listaIcons.length) {
      case 2:
        return navBarDupla();
      case 3:
        return navBarTripla();
      case 4:
        return navBarQuadrupla();
      case 5:
        return navBarPenta();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget navBarDupla() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: (context.percentWidth(0.2) * 2),
            decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: context.primaryColor),
                boxShadow:
                    CustomBoxShadow(context: context).primaryBoxShadow()),
            child: Builder(builder: (context) {
              List<Widget> listaRetornar = [];
              for (int i = 0; i < widget.listaIcons.length; i++) {
                if (i != 0) {
                  listaRetornar.add(const Spacer());
                }
                listaRetornar.add(
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Material(
                      color: i == widget.currentIndex
                          ? context.tertiaryColor
                          : context.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          widget.onTap(i);
                        },
                        splashColor: context.primaryColor,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          width: context.percentWidth(0.16),
                          height: 50,
                          child: Icon(
                            widget.listaIcons[i],
                            color: i == widget.currentIndex
                                ? context.primaryColor
                                : context.tertiaryColor,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                if (i != 1) {
                  listaRetornar.add(const Spacer());
                }
              }
              return Row(
                children: listaRetornar,
                // children: List.generate(
                //   widget.listaIcons.length,
                //   (index) => Material(
                //     color: Colors.transparent,
                //     borderRadius: BorderRadius.circular(32),
                //     child: InkWell(
                //       borderRadius: BorderRadius.circular(32),
                //       onTap: () {
                //         print('onTapListened');
                //       },
                //       child: SizedBox(
                //         width: context.percentWidth(0.2),
                //         height: 70,
                //         child: Icon(
                //           widget.listaIcons[index],
                //           color: context.isDarkTheme
                //               ? context.theme.colorScheme.secondary
                //               : context.tertiaryColor,
                //           size: 36,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget navBarTripla() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          // width: (context.percentWidth(0.2) * 3),
          width: context.width,
          decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: context.primaryColor.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Builder(builder: (context) {
            List<Widget> listaRetornar = [Spacer()];
            for (int i = 0; i < widget.listaIcons.length; i++) {
              if (i != 0) {
                listaRetornar.add(const Spacer());
              }
              listaRetornar.add(
                Material(
                  color: i == widget.currentIndex
                      ? context.tertiaryColor
                      : context.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      widget.onTap(i);
                    },
                    splashColor: context.primaryColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: context.percentWidth(0.15),
                      height: 50,
                      child: Icon(
                        widget.listaIcons[i],
                        color: i == widget.currentIndex
                            ? context.primaryColor
                            : context.tertiaryColor,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              );
              if (i != 3) {
                listaRetornar.add(const Spacer());
              }
            }
            return Row(
              children: listaRetornar,
            );
          }),
        ),
      ],
    );
  }

  Widget navBarQuadrupla() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          // width: (context.percentWidth(0.2) * 3),
          width: context.width,
          decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: context.primaryColor.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Builder(
            builder: (context) {
              List<Widget> listaRetornar = [Spacer()];
              for (int i = 0; i < widget.listaIcons.length; i++) {
                if (i != 0) {
                  listaRetornar.add(const Spacer());
                }
                listaRetornar.add(
                  Material(
                    color: i == widget.currentIndex
                        ? context.tertiaryColor
                        : context.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        widget.onTap(i);
                      },
                      splashColor: context.primaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: context.percentWidth(0.14),
                        height: 50,
                        child: Icon(
                          widget.listaIcons[i],
                          color: i == widget.currentIndex
                              ? context.primaryColor
                              : context.tertiaryColor,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                );
                if (i != 4) {
                  listaRetornar.add(const Spacer());
                }
              }
              return Row(
                children: listaRetornar,
              );
            },
          ),
        ),
      ],
    );
  }
  Widget navBarPenta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          // width: (context.percentWidth(0.2) * 3),
          width: context.width,
          decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: context.primaryColor.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Builder(
            builder: (context) {
              List<Widget> listaRetornar = [Spacer()];
              for (int i = 0; i < widget.listaIcons.length; i++) {
                if (i != 0) {
                  listaRetornar.add(const Spacer());
                }
                listaRetornar.add(
                  Material(
                    color: i == widget.currentIndex
                        ? context.tertiaryColor
                        : context.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        widget.onTap(i);
                      },
                      splashColor: context.primaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: context.percentWidth(0.14),
                        height: 50,
                        child: Icon(
                          widget.listaIcons[i],
                          color: i == widget.currentIndex
                              ? context.primaryColor
                              : context.tertiaryColor,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                );
                if (i != 5) {
                  listaRetornar.add(const Spacer());
                }
              }
              return Row(
                children: listaRetornar,
              );
            },
          ),
        ),
      ],
    );
  }
}
