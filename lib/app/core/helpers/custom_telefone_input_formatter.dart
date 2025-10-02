import 'package:flutter/services.dart';

class CustomTelefoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), ''); // remove tudo que não for número

    if (digits.length > 11) {
      digits = digits.substring(0, 11); // limita a 11 dígitos
    }

    String formatted = '';

    if (digits.isNotEmpty) {
      formatted += '(';
    }
    if (digits.length >= 2) {
      formatted += '${digits.substring(0, 2)}) ';
    } else if (digits.length == 1) {
      formatted += digits;
    }

    if (digits.length >= 7) {
      formatted += '${digits.substring(2, 7)}-';
      formatted += digits.substring(7);
    } else if (digits.length > 2) {
      formatted += digits.substring(2);
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
