import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future<void> register() async {
    final _enteredEmail = emailController.text.trim();
    final _enteredPassword = passwordController.text.trim();

    if (!state.formKey.currentState!.validate()) {
      return;
    }

    try {
      state = state.copyWith(
        registerValue: const AsyncLoading(),
      );
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);

      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({
        'fullname': nameController.text.trim(),
        'email': _enteredEmail,
        'role': state.roleValue,
        // Add other user information as needed
      });

      state = state.copyWith(
        registerValue: AsyncValue.data(userCredentials.toString()),
      );
    } on FirebaseException catch (error, stackTrace) {
      state = state.copyWith(
        registerValue: AsyncError(error, stackTrace),
        errors: {'message': error.message},
      );

      throw error.message as Object;
    }
  }

  void onObscureTap() {
    // with state.copyWith in Riverpod
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  void onObscureConfirmTap() {
    state = state.copyWith(
      isObscureConfirm: !state.isObscureConfirm,
    );
  }

  String? validateName(String? value) {
    if (value!.isEmpty || value == null) {
      return "Cannot be empty";
    }
    return null;
  }

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

  String? validatePasswordConfirm(String? value) {
    if (value!.isEmpty || value == null) {
      return "Cannot be empty";
    } else if (value.length <= 8) {
      return "Password must be more than 8";
    } else if (value != passwordController.text) {
      return "Password confirm doesn't match";
    }
    return null;
  }

  void onRoleValueChanged(value) {
    state = state.copyWith(
      roleValue: value,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }
}

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>(
  (ref) => RegisterController(),
);
