class InvalidCredentialsException implements Exception {
  final String? message;
  InvalidCredentialsException({
    this.message,
  });
}
