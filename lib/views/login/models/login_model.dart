// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool result;
    String message;
    String accessToken;
    String tokenType;
    dynamic expiresAt;
    User user;

    LoginModel({
        required this.result,
        required this.message,
        required this.accessToken,
        required this.tokenType,
        required this.expiresAt,
        required this.user,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        result: json["result"],
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresAt: json["expires_at"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_at": expiresAt,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String type;
    String name;
    int membership;
    DateTime emailVerifiedAt;
    int photoApproved;
    int blocked;
    int deactivated;
    int approved;
    String email;
    String avatar;
    String avatarOriginal;
    String phone;

    User({
        required this.id,
        required this.type,
        required this.name,
        required this.membership,
        required this.emailVerifiedAt,
        required this.photoApproved,
        required this.blocked,
        required this.deactivated,
        required this.approved,
        required this.email,
        required this.avatar,
        required this.avatarOriginal,
        required this.phone,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        membership: json["membership"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        photoApproved: json["photo_approved"],
        blocked: json["blocked"],
        deactivated: json["deactivated"],
        approved: json["approved"],
        email: json["email"],
        avatar: json["avatar"],
        avatarOriginal: json["avatar_original"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "membership": membership,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "photo_approved": photoApproved,
        "blocked": blocked,
        "deactivated": deactivated,
        "approved": approved,
        "email": email,
        "avatar": avatar,
        "avatar_original": avatarOriginal,
        "phone": phone,
    };
}
