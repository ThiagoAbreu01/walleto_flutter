import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), ''); // remove tudo que não for número

    if (digits.length > 11) {
      digits = digits.substring(0, 11); // limita a 11 dígitos
    }

    String formatted = '';

    if (digits.length >= 4) {
      formatted += '-';
    }
    if (digits.length >= 7) {
      formatted += '-';
    }
    if (digits.length >= 10) {
      formatted += '.';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
