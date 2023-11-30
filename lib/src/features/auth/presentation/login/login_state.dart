import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AsyncValue<String?> loginValue;
  final Map<String, dynamic>? errors;

  final bool isObscure;
  LoginState({
    this.loginValue = const AsyncData(null),
    this.isObscure = true,
    this.errors,
  });

  bool get isLoading => loginValue.isLoading;

  LoginState copyWith({
    AsyncValue<String?>? loginValue,
    bool? isObscure,
    Map<String, dynamic>? errors,
  }) {
    return LoginState(
      loginValue: loginValue ?? this.loginValue,
      isObscure: isObscure ?? this.isObscure,
      errors: errors ?? this.errors,
    );
  }
}
