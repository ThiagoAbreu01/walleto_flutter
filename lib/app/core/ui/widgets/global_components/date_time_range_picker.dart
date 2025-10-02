import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class DateTimeRangePicker {
  Future<DateTimeRangePicker?> getDateTimeRange(
      BuildContext context,
      TextEditingController controllerInputDate,
      Function(DateTimeRange? dateTime) onSelected) async {
    return await showDateRangePicker(
      useRootNavigator: false,
      builder: ((context, child) {
        return Theme(
          // data: ThemeData.light(),
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onSurface: context.secondaryColor,
              onPrimary: context.primaryColor,
              primary: context.secondaryColor,
              surface: context.secondaryColor,
            ),
            textTheme: TextTheme(
                labelSmall:
                    TextStyle(fontSize: 16, color: context.tertiaryColor)),
            dialogTheme: DialogThemeData(
              backgroundColor: context.tertiaryContainer,
            ),
          ),
          child: child!,
        );
      }),
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    ).then((DateTimeRange? value) {
      if (value != null) {
        onSelected(value);
      } else {
        return;
      }
      return null;
    });
  }
}
