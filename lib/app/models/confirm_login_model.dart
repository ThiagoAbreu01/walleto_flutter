import 'dart:convert';

class ConfirmLogin {
  final String accessToken;
  final String refreshToken;
  ConfirmLogin({
    required this.accessToken,
    required this.refreshToken,
  });

  ConfirmLogin copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return ConfirmLogin(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory ConfirmLogin.fromMap(Map<String, dynamic> map) {
    return ConfirmLogin(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmLogin.fromJson(String source) =>
      ConfirmLogin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ConfirmLogin(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant ConfirmLogin other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
