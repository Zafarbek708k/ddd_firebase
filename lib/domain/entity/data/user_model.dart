// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final String? userId;
  final String? email;
  final String? name;
  final String? givenName;
  final String? familyName;
  final String? nickname;
  final String? lastIp;
  final int? loginsCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLogin;
  final bool? emailVerified;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.givenName,
    this.familyName,
    this.nickname,
    this.lastIp,
    this.loginsCount,
    this.createdAt,
    this.updatedAt,
    this.lastLogin,
    this.emailVerified,
  });

  UserModel copyWith({
    String? userId,
    String? email,
    String? name,
    String? givenName,
    String? familyName,
    String? nickname,
    String? lastIp,
    int? loginsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLogin,
    bool? emailVerified,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        name: name ?? this.name,
        givenName: givenName ?? this.givenName,
        familyName: familyName ?? this.familyName,
        nickname: nickname ?? this.nickname,
        lastIp: lastIp ?? this.lastIp,
        loginsCount: loginsCount ?? this.loginsCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastLogin: lastLogin ?? this.lastLogin,
        emailVerified: emailVerified ?? this.emailVerified,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    email: json["email"],
    name: json["name"],
    givenName: json["given_name"],
    familyName: json["family_name"],
    nickname: json["nickname"],
    lastIp: json["last_ip"],
    loginsCount: json["logins_count"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
    emailVerified: json["email_verified"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "email": email,
    "name": name,
    "given_name": givenName,
    "family_name": familyName,
    "nickname": nickname,
    "last_ip": lastIp,
    "logins_count": loginsCount,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "last_login": lastLogin?.toIso8601String(),
    "email_verified": emailVerified,
  };
}
