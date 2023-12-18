// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meetzy/src/features/auth/data/responses/user_response.dart';

class User {
  final String id;
  final String email;
  final String fullname;
  final RoleUser role;
  final StatusUser status;

  User({
    required this.id,
    required this.email,
    required this.fullname,
    this.status = StatusUser.pending,
    this.role = RoleUser.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullname': fullname,
      'status': status,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
      status: map['status'] as StatusUser,
      role: map['role'] as RoleUser,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  factory User.fromResponse(UserResponse response) {
    return User(
      id: response.id ?? "",
      email: response.email ?? '',
      fullname: response.fullname ?? '',
      status: response.status ?? StatusUser.pending,
      role: response.role ?? RoleUser.user,
    );
  }
}
