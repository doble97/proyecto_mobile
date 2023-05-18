// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse apiResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String apiResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final Data data;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.friends,
    required this.pendingRequests,
    required this.decks,
    required this.sharedDecks,
    required this.followedDecks,
    required this.token,
    required this.user,
  });

  final String token;
  final UserModel user;
  final int friends;
  final int pendingRequests;
  final int decks;
  final int sharedDecks;
  final int followedDecks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      token: json["token"],
      user: UserModel.fromJson(json["user"]),
      friends: json['friends'],
      pendingRequests: json['pending_requests'],
      decks: json["decks"],
      sharedDecks: json["shared_decks"],
      followedDecks: json["followed_decks"]);

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
        "friends": friends,
        "pending_requests": pendingRequests,
        "decks": decks,
        "shared_decks": sharedDecks,
        "followed_decks": followedDecks,
      };
}

class UserModel {
  UserModel(
      {required this.name,
      required this.lastName,
      required this.email,
      required this.updatedAt,
      required this.createdAt,
      required this.id,
      this.email_verified_at});

  final String name;
  final String lastName;
  final String email;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final DateTime? email_verified_at;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json["name"],
      lastName: json["last_name"],
      email: json["email"],
      updatedAt: DateTime.parse(json["updated_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      id: json["id"],
      email_verified_at: json['email_verified_at']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
