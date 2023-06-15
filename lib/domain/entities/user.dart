import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  const User.empty()
      : id = 000,
        email = '',
        name = '',
        username = '',
        website = '',
        phone = '';

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        website: website ?? this.website,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        phone,
        website,
      ];
}
