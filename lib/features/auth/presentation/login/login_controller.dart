import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meetzy/features/auth/presentation/login/login_state.dart';

class LoginControllerProvider extends StateNotifier<LoginState> {
  LoginControllerProvider() : super(LoginState());
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value!.isEmpty || value == null) {
      return "Cannot be empty";
    } else if (!EmailValidator.validate(value)) {
      return "email not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty || value == null) {
      return "Cannot be empty";
    }
    if (value.length <= 8) {
      return "Password must be more than 8";
    }
    return null;
  }

  Future<void> login() async {}

  void onObscureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginControllerProvider, LoginState>(
  (ref) => LoginControllerProvider(),
);
