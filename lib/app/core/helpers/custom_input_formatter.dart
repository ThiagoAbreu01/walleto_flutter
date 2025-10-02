class CustomInputFormatter {
  static CustomInputFormatter? _instance;

  CustomInputFormatter._();

  static CustomInputFormatter? get i {
    _instance ??= CustomInputFormatter._();
    return _instance!;
  }

  static String removeEspacosInicioFim(String input) {
    input = input.replaceAll(RegExp(r'\s+'), ' ');
    return input.trimRight().trimLeft();
  }

  static String substituiEspacoPorUnderscore(String input) {
    return input.replaceAll(' ', '_');
  }

  static String substituiUnderscorePorEspaco(String input) {
    return input.replaceAll('_', ' ');
  }

  static String getColumnLabel(int colNumber) {
    const int alphabetSize = 26;
    final int charCodeA = 'A'.codeUnitAt(0);

    if (colNumber <= alphabetSize) {
      return String.fromCharCode(charCodeA + colNumber - 1);
    } else {
      int firstCharIndex = ((colNumber - 1) ~/ alphabetSize) + charCodeA - 1;
      int secondCharIndex = ((colNumber - 1) % alphabetSize) + charCodeA;

      return String.fromCharCode(firstCharIndex) +
          String.fromCharCode(secondCharIndex);
    }
  }
}
