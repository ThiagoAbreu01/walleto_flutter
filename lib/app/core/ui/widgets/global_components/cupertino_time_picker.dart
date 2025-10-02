// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:walleto_flutter/app/core/ui/styles/text_styles.dart';
import 'package:walleto_flutter/app/core/ui/widgets/custom_buttom/custom_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomCupertinoTimePicker extends StatefulWidget {
  String sheetTitle;
  Duration initialTimer;
  Function(Duration changeTimer) onChangeTimer;
  CustomCupertinoTimePicker({
    super.key,
    required this.sheetTitle,
    required this.initialTimer,
    required this.onChangeTimer,
  });

  @override
  State<CustomCupertinoTimePicker> createState() =>
      _CustomCupertinoTimePickerState();
}

class _CustomCupertinoTimePickerState extends State<CustomCupertinoTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      color: context.isDarkTheme
          ? context.tertiaryContainer
          : context.primaryColor,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: context.width,
            height: 55,
            child: Center(
              child: Text(
                widget.sheetTitle,
                textAlign: TextAlign.center,
                style: TextStyles.i.textBold.copyWith(
                  fontSize: 14,
                  color: context.tertiaryColor,
                  textBaseline: null,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            minuteInterval: 1,
            secondInterval: 1,
            initialTimerDuration: widget.initialTimer,
            onTimerDurationChanged: (Duration changeTimer) {
              setState(() {
                widget.initialTimer = changeTimer;
                // double selectedValueToDouble =
                //     double.parse((changeTimer.inMinutes / 60).toStringAsFixed(2));
                // int hours = selectedValueToDouble.floor();
                // int minutes = ((selectedValueToDouble - hours) * 60).round();
                // String timeStringPortuguese =
                //     '${hours.toString().padLeft(2, '0')} Hora(s) e ${minutes.toString().padLeft(2, '0')} Minuto(s)';
                HapticFeedback.lightImpact();
              });
              widget.onChangeTimer(changeTimer);
            },
          ),
          CustomButton(
            backgroundColor: context.isDarkTheme
                ? context.secondaryColor
                : context.tertiaryColor,
            splashColor: context.tertiaryContainer,
            width: context.percentWidth(0.8),
            height: 50,
            borderRadius: BorderRadius.circular(8),
            useImageAsIcon: false,
            icon: Icons.arrow_back_ios,
            iconColor: context.isDarkTheme
                ? context.primaryColor
                : context.secondaryColor,
            label: 'Fechar',
            labelColor: context.isDarkTheme
                ? context.primaryColor
                : context.secondaryColor,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
