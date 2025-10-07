// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

class LoggedUserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? cpf;
  final String? telephone;
  String? password;
  String? iosToken;
  String? androidToken;
  String? refreshToken;
  String? recoverToken;
  Uint8List? profileImage;
  DateTime? criationDate;
  LoggedUserModel({
    this.id,
    this.name,
    this.email,
    this.cpf,
    this.telephone,
    this.password,
    this.iosToken,
    this.androidToken,
    this.refreshToken,
    this.recoverToken,
    this.profileImage,
    this.criationDate,
  });

  LoggedUserModel copyWith({
    int? id,
    String? name,
    String? email,
    // String? cpf,
    String? telephone,
    String? password,
    String? iosToken,
    String? androidToken,
    String? refreshToken,
    String? recoverToken,
    Uint8List? profileImage,
    DateTime? criationDate,
  }) {
    return LoggedUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      // cpf: cpf ?? this.cpf,
      telephone: telephone ?? this.telephone,
      password: password ?? this.password,
      iosToken: iosToken ?? this.iosToken,
      androidToken: androidToken ?? this.androidToken,
      refreshToken: refreshToken ?? this.refreshToken,
      recoverToken: recoverToken ?? this.recoverToken,
      profileImage: profileImage ?? this.profileImage,
      criationDate: criationDate ?? this.criationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      // 'cpf': cpf,
      'telephone': telephone,
      'password': password,
      'ios_token': iosToken,
      'android_token': androidToken,
      'refresh_token': refreshToken,
      'recover_token': recoverToken,
      'profile_image': (profileImage != null) == true
          ? base64Encode(profileImage!)
          : null,
      'criation_date': criationDate?.toUtc().toIso8601String(),
    };
  }

  factory LoggedUserModel.fromMap(Map<String, dynamic> map) {
    return LoggedUserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      // cpf: map['cpf'] as String,
      telephone: map['telephone'] as String,
      password: map['password'] as String,
      iosToken: map['ios_token'] != null ? map['ios_token'] as String : null,
      androidToken:
          map['android_token'] != null ? map['android_token'] as String : null,
      refreshToken:
          map['refresh_token'] != null ? map['refresh_token'] as String : null,
      recoverToken:
          map['recover_token'] != null ? map['recover_token'] as String : null,
      // profileImage:
      //     map['profile_image'] != null
      //         ? Uint8List.fromList(map['profile_image'] as List<int>)
      //         : null,
      profileImage: map['profile_image'] != null
          ? base64Decode(map['profile_image'])
          : null,
      criationDate: map['creation_date'] != null
          ? DateTime.parse(map['creation_date'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserModel.fromJson(String source) =>
      LoggedUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// // ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

// import 'dart:convert';

// class LoggedLoggedUserModelModel {
//   final int? id;
//   final String? name;
//   final String? email;
//   final String? password;
//   final String? passRecoveyToken;
//   final bool? emailConfirmed;
//   final String? tokenConfirmEmail;
//   final String? iosToken;
//   final String? androidToken;
//   final String? refreshToken;
//   final String? recoverToken;
//   final String? socialId;
//   final String? registerType;
//   final String? imageUrl;
//   final DateTime? dateRegister;
//   final DateTime? datePremiumUntil;
//   final List<String>? listConstructions;
//   List<String>? listMinhasObras;
//   List<String>? listObrasQueParticipo;
//   final bool? isPremium;
//   double? deskCoins;
//   String? permissao;
//   bool? notificationsEnabled;

//   LoggedLoggedUserModelModel({
//     this.id,
//     this.name,
//     this.email,
//     this.password,
//     this.passRecoveyToken,
//     this.emailConfirmed,
//     this.tokenConfirmEmail,
//     this.iosToken,
//     this.androidToken,
//     this.refreshToken,
//     this.recoverToken,
//     this.socialId,
//     this.registerType,
//     this.imageUrl,
//     this.dateRegister,
//     this.datePremiumUntil,
//     this.listConstructions,
//     this.listMinhasObras,
//     this.listObrasQueParticipo,
//     this.isPremium,
//     this.deskCoins,
//     this.permissao,
//     this.notificationsEnabled,
//   });

//   LoggedLoggedUserModelModel copyWith({
//     int? id,
//     String? name,
//     String? email,
//     String? password,
//     String? passRecoveyToken,
//     bool? emailConfirmed,
//     String? tokenConfirmEmail,
//     String? iosToken,
//     String? androidToken,
//     String? refreshToken,
//     String? recoverToken,
//     String? socialId,
//     String? registerType,
//     String? imageUrl,
//     DateTime? dateRegister,
//     DateTime? datePremiumUntil,
//     List<String>? listConstructions,
//     List<String>? listMinhasObras,
//     List<String>? listObrasQueParticipo,
//     bool? isPremium,
//     double? deskCoins,
//     String? permissao,
//     bool? notificationsEnabled,
//   }) {
//     return LoggedLoggedUserModelModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       passRecoveyToken: passRecoveyToken ?? this.passRecoveyToken,
//       emailConfirmed: emailConfirmed ?? this.emailConfirmed,
//       tokenConfirmEmail: tokenConfirmEmail ?? this.tokenConfirmEmail,
//       iosToken: iosToken ?? this.iosToken,
//       androidToken: androidToken ?? this.androidToken,
//       refreshToken: refreshToken ?? this.refreshToken,
//       recoverToken: recoverToken ?? this.recoverToken,
//       socialId: socialId ?? this.socialId,
//       registerType: registerType ?? this.registerType,
//       imageUrl: imageUrl ?? this.imageUrl,
//       dateRegister: dateRegister ?? this.dateRegister,
//       datePremiumUntil: datePremiumUntil ?? this.datePremiumUntil,
//       listConstructions: listConstructions ?? this.listConstructions,
//       listMinhasObras: listMinhasObras ?? this.listMinhasObras,
//       listObrasQueParticipo:
//           listObrasQueParticipo ?? this.listObrasQueParticipo,
//       isPremium: isPremium ?? this.isPremium,
//       deskCoins: deskCoins ?? this.deskCoins,
//       permissao: permissao ?? this.permissao,
//       notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'passRecoveyToken': passRecoveyToken,
//       'emailConfirmed': emailConfirmed,
//       'tokenConfirmEmail': tokenConfirmEmail,
//       'iosToken': iosToken,
//       'androidToken': androidToken,
//       'refreshToken': refreshToken,
//       'recoverToken': recoverToken,
//       'socialId': socialId,
//       'registerType': registerType,
//       'imageUrl': imageUrl,
//       'dateRegister': dateRegister?.toIso8601String(),
//       'datePremiumUntil': datePremiumUntil?.toIso8601String(),
//       'listConstructions': listConstructions,
//       'listMinhasObras': listMinhasObras,
//       'listObrasQueParticipo': listObrasQueParticipo,
//       'isPremium': isPremium,
//       'desk_coins': deskCoins,
//       'permissao': permissao,
//       'notifications_enabled': notificationsEnabled,
//     };
//   }

//   factory LoggedLoggedUserModelModel.fromMap(Map<String, dynamic> map) {
//     DateTime dateRegister = DateTime.parse(map['dateRegister']);
//     DateTime datePremiumUntil = DateTime.parse(map['datePremiumUntil']);
//     return LoggedLoggedUserModelModel(
//       id: map['id'] != null ? map['id'] as int : null,
//       name: map['name'] != null ? map['name'] as String : null,
//       email: map['email'] != null ? map['email'] as String : null,
//       password: map['password'] != null ? map['password'] as String : null,
//       passRecoveyToken: map['passRecoveyToken'] != null
//           ? map['passRecoveyToken'] as String
//           : null,
//       emailConfirmed:
//           map['emailConfirmed'] != null ? map['emailConfirmed'] as bool : null,
//       tokenConfirmEmail: map['tokenConfirmEmail'] != null
//           ? map['tokenConfirmEmail'] as String
//           : null,
//       iosToken: map['iosToken'] != null ? map['iosToken'] as String : null,
//       androidToken:
//           map['androidToken'] != null ? map['androidToken'] as String : null,
//       refreshToken:
//           map['refreshToken'] != null ? map['refreshToken'] as String : null,
//       recoverToken:
//           map['recoverToken'] != null ? map['recoverToken'] as String : null,
//       socialId: map['socialId'] != null ? map['socialId'] as String : null,
//       registerType:
//           map['registerType'] != null ? map['registerType'] as String : null,
//       imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
//       dateRegister: map['dateRegister'] != null ? dateRegister : null,
//       datePremiumUntil:
//           map['datePremiumUntil'] != null ? datePremiumUntil : null,
//       listConstructions: map['listConstructions'] != null
//           ? List<String>.from((map['listConstructions'] as List<dynamic>))
//           : null,
//       listMinhasObras: map['listMinhasObras'] != null
//           ? List<String>.from((map['listMinhasObras'] as List<dynamic>))
//           : null,
//       listObrasQueParticipo: map['listObrasQueParticipo'] != null
//           ? List<String>.from((map['listObrasQueParticipo'] as List<dynamic>))
//           : null,
//       isPremium: map['isPremium'] != null ? map['isPremium'] as bool : null,
//       deskCoins: map['desk_coins'] != null ? map['desk_coins'] as double : 0.0,
//       permissao: map['permissao'] != null ? map['permissao'] as String : null,
//       notificationsEnabled: map['notifications_enabled'] != null
//           ? map['notifications_enabled'] as bool
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory LoggedLoggedUserModelModel.fromJson(String source) {
//     return LoggedLoggedUserModelModel.fromMap(json.decode(source) as Map<String, dynamic>);
//   }

//   @override
//   String toString() {
//     return 'LoggedLoggedUserModelModel(id: $id, name: $name, email: $email, password: $password, passRecoveyToken: $passRecoveyToken, emailConfirmed: $emailConfirmed, tokenConfirmEmail: $tokenConfirmEmail, iosToken: $iosToken, androidToken: $androidToken, refreshToken: $refreshToken, recoverToken: $recoverToken, socialId: $socialId, registerType: $registerType, imageUrl: $imageUrl, dateRegister: $dateRegister, datePremiumUntil: $datePremiumUntil, listConstructions: $listConstructions, listMinhasObras: $listMinhasObras, listObrasQueParticipo: $listObrasQueParticipo, isPremium: $isPremium, permissao: $permissao)';
//   }
// }
