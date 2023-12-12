import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/application/auth_service.dart';
import 'package:meetzy/src/features/auth/domain/request_register.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';

final _firebase = FirebaseAuth.instance;

class RegisterController extends StateNotifier<RegisterState> {
  final AuthService _authService;

  RegisterController(
    this._authService,
  ) : super(RegisterState());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future<void> register() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    try {
      state = state.copyWith(
        registerValue: const AsyncLoading(),
      );

      final requestRegister = RequestRegister(
        fullname: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: state.roleValue,
      );

      final result = await _authService.register(requestRegister);

      result.when(
        success: (data) {
          // success
          state = state.copyWith(
            registerValue: AsyncData(data),
          );
        },
        failure: (error, stackTrace) {
          final errors = NetworkExceptions.getErrors(error);

          // failure
          state = state.copyWith(
            registerValue: AsyncError(error, stackTrace),
            errors: errors,
          );
        },
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
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final authService = ref.read(authServiceProvider);

  return RegisterController(authService);
});
