class UserDoesNotExistException implements Exception {
  final String? message;
  UserDoesNotExistException({
    this.message,
  });
}
