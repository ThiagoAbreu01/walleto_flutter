// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final TextEditingController inputController;
  final String hintText;
  final double? height;
  final EdgeInsets? alturaTexto;
  final Color? textAndIconColor;
  final Color? backGroundColor;
  final BorderRadius? radius;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool? enabled;
  const CustomDatePicker({
    super.key,
    this.onDateSelected,
    required this.inputController,
    required this.hintText,
    this.radius,
    this.height,
    this.alturaTexto,
    this.backGroundColor,
    this.textAndIconColor,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.enabled,
  });

  @override
  CustomDatePickerState createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.percentWidth(0.9),
        height: widget.height ?? 68,
        decoration: BoxDecoration(
            color: Colors.transparent,
            // border: Border.all(color: context.primaryColor),
            borderRadius:
                widget.radius ?? const BorderRadius.all(Radius.circular(6))),
        child: Material(
          borderRadius:
              widget.radius ?? const BorderRadius.all(Radius.circular(32)),
          color: widget.backGroundColor ?? context.tertiaryColor,
          child: InkWell(
            borderRadius:
                widget.radius ?? const BorderRadius.all(Radius.circular(32)),
            onTap: () async {
              if (widget.enabled != null && widget.enabled == false) return;

              final date = await showDatePicker(
                context: context,
                useRootNavigator: false,
                initialDate: widget.initialDate ?? DateTime.now(),
                firstDate: widget.firstDate ?? DateTime(2000),
                lastDate: widget.lastDate ?? DateTime(2100),
                builder: ((context, child) {
                  if (context.isDarkTheme) {
                    return Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: ColorScheme.dark(
                          //! primary -> Cor da data de hoje circulada (NÃO A SELECIONADA), afeta o número também além do círculo.
                          primary: context.tertiaryColor,
                          //! onPrimary -> Cor do texto quando uma data é selecionada
                          onPrimary: context.primaryColor,
                          //!secondaryContainer -> Cor do range da seleção
                          secondaryContainer: context.tertiaryColor,
                          //!onSurface -> Cores da coluna de dias da semana e Nomes de cada mês com ano, exemplo: Janeiro 2025
                          onSurface: context.tertiaryColor,
                          //!onSurfaceVariant -> Cor das letras e ícones do cabeçalho, e do efeito Hover do onClick ao escolher uma data
                          onSurfaceVariant: context.tertiaryColor,
                          //!outlineVariant -> Cor da linha do cabeçalho
                          outlineVariant: context.tertiaryColor,

                          scrim: context.tertiaryColor,
                          shadow: Colors.pink,

                          tertiary: context.tertiaryColor,
                          tertiaryContainer: context.tertiaryColor,
                          onTertiaryContainer: context.tertiaryColor,
                          onTertiary: context.tertiaryColor,
                          surface: context.primaryColor,
                          brightness: Brightness.dark,
                          //*Indiferentes
                          primaryContainer: context.secondaryColor,
                          onPrimaryContainer: context.secondaryColor,
                          inversePrimary: context.secondaryColor,
                          secondary: context.secondaryColor,
                          onSecondary: context.secondaryColor,
                          onSecondaryContainer: Colors.lightGreen,

                          surfaceTint: context.secondaryColor,

                          surfaceContainerHighest: context.secondaryColor,
                          inverseSurface: context.secondaryColor,
                          onInverseSurface: context.secondaryColor,

                          //!Testando
                          outline: context.secondaryColor,
                        ),
                        textTheme: TextTheme(
                          labelSmall: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      child: child!,
                    );
                  } else {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          onPrimary: context.secondaryColor,
                          primary: context.tertiaryColor,
                          primaryContainer: context.secondaryColor,
                          onPrimaryContainer: context.secondaryColor,
                          inversePrimary: context.secondaryColor,

                          onSecondary: context.secondaryColor,
                          secondary: context.secondaryColor,
                          secondaryContainer: context.secondaryColor,
                          onSecondaryContainer: context.secondaryColor,
                          onSurface: context.secondaryColor,

                          //!Cores das letras e etc do cabeçalho
                          surface: context.tertiaryColor,
                          surfaceTint: context.tertiaryColor,
                          onSurfaceVariant: context.tertiaryColor,
                          surfaceContainerHighest: context.tertiaryColor,
                          inverseSurface: context.tertiaryColor,
                          onInverseSurface: context.tertiaryColor,

                          //!Testando
                          outline: Colors.blue,
                          outlineVariant: context.secondaryColor,
                        ),
                        textTheme: TextTheme(
                          bodySmall: TextStyle(
                            fontSize: 16,
                            color: context.theme.colorScheme.tertiary,
                          ),
                          bodyMedium: TextStyle(
                            fontSize: 16,
                            color: context.theme.colorScheme.tertiary,
                          ),
                          bodyLarge: TextStyle(
                            fontSize: 16,
                            color: context.theme.colorScheme.tertiary,
                          ),
                          labelSmall: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                          labelMedium: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                          labelLarge: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        primaryTextTheme: TextTheme(
                          labelSmall: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                          labelMedium: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                          labelLarge: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      child: child!,
                    );
                  }
                }),
              );

              if (date != null) {
                final String datePTBR = DateFormat('dd/MM/yyyy').format(date);

                widget.inputController.text = datePTBR;

                if (widget.onDateSelected != null) {
                  widget.onDateSelected!(date);
                }
              }
            },
            child: Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  width: context.percentWidth(0.73),
                  height: context.percentHeight(0.08),
                  color: Colors.transparent,
                  child: Padding(
                    padding:
                        widget.alturaTexto ?? const EdgeInsets.only(top: 10.0),
                    child: TextField(
                      style: TextStyle(
                        color: widget.textAndIconColor ?? context.primaryColor,
                        fontSize: 16,
                      ),
                      controller: widget.inputController,
                      enabled: false,
                      decoration: InputDecoration(
                        label: Text(
                          widget.hintText,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: context.percentWidth(0.10),
                  color: Colors.transparent,
                  child: Icon(
                    Icons.calendar_month,
                    color: widget.textAndIconColor ?? context.primaryColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
