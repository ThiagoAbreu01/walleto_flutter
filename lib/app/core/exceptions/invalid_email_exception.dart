class InvalidEmailException implements Exception {
  final String? message;
  InvalidEmailException({
    this.message,
  });
}
