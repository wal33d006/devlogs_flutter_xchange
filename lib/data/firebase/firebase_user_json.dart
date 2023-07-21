import 'package:devlogs_flutter_xchange/domain/entities/user.dart';

class FirebaseUserJson {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;

  FirebaseUserJson({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory FirebaseUserJson.fromJson(Map<String, dynamic> json) => FirebaseUserJson(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
      );

  User toDomain() => const User.empty().copyWith(
        id: id.toString(),
        name: name,
        username: username,
        email: email,
        phone: phone,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'phone': phone,
      };
}
