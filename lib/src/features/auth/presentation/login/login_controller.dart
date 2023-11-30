import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

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

    return null;
  }

  Future<void> login() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }
    state = state.copyWith(
      loginValue: const AsyncLoading(),
    );

    try {
      final userCredential = await _firebase.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      state = state.copyWith(
          loginValue: AsyncValue.data(
        userCredential.user?.email,
      ));
    } on FirebaseException catch (error, stackTrace) {
      state = state.copyWith(
        loginValue: AsyncError(error, stackTrace),
        errors: {'message': error.code?.replaceAll('-', ' ')},
      );
      return;
    }
  }

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
