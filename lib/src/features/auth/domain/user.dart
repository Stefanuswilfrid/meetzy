// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String email;
  final String fullname;
  final String role;

  User({
    required this.id,
    required this.email,
    required this.fullname,
    this.role = "User",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullname': fullname,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  // factory User.fromResponse(UserResponse response) {
  //   return User(
  //     id: response.id ?? 0,
  //     email: response.email ?? '',
  //     fullname: response.fullname ?? '',
  //     status: response.status ?? StatusUser.pending,
  //     role: response.role ?? RoleUser.user,
  //   );
  // }
}
