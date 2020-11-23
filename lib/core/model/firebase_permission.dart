import 'dart:convert';

FirebasePermission firebasePermissionFromJson(String str) => FirebasePermission.fromJson(json.decode(str));

String firebasePermissionToJson(FirebasePermission data) => json.encode(data.toJson());

class FirebasePermission {
  FirebasePermission({
    this.url,
    this.permission,
  });

  String url;
  bool permission;

  factory FirebasePermission.fromJson(Map<String, dynamic> json) => FirebasePermission(
    url: json["url"] ?? '',
    permission: json["permission"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "permission": permission,
  };
}