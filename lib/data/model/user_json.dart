import 'package:devlogs_flutter_xchange/domain/entities/user.dart';

class UserJson {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  UserJson({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory UserJson.fromJson(Map<String, dynamic> json) => UserJson(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        username: json['username'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        website: json['website'] as String? ?? '',
      );

  User toDomain() => User(
        id: id.toString(),
        name: name,
        username: username,
        email: email,
        phone: phone,
        website: website,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'phone': phone,
        'website': website,
      };
}
