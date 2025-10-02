// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginViewModel {
  final String email;
  final String password;
  LoginViewModel({
    required this.email,
    required this.password,
  });

  LoginViewModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginViewModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginViewModel.fromMap(Map<String, dynamic> map) {
    return LoginViewModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginViewModel.fromJson(String source) =>
      LoginViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginViewModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginViewModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
