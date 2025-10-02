class WrongEmailConfirmationCodeException implements Exception {
  final String? message;
  WrongEmailConfirmationCodeException({
    this.message,
  });
}
