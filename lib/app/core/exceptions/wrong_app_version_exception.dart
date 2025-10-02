// ignore_for_file: public_member_api_docs, sort_constructors_first
class WrongAppVersionException implements Exception {
  final String? message;
  WrongAppVersionException({
    this.message,
  });
}
