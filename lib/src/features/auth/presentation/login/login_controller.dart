import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meetzy/src/features/auth/application/auth_service.dart';
import 'package:meetzy/src/features/auth/domain/request_login.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_state.dart';

class LoginControllerProvider extends StateNotifier<LoginState> {
  final AuthService _authService;

  LoginControllerProvider(
    this._authService,
  ) : super(LoginState());
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

    final requestLogin = RequestLogin(
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await _authService.login(requestLogin);
    result.when(
      success: (data) {
        // success
        state = state.copyWith(
          loginValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        // failure
        state = state.copyWith(
          loginValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void onObscureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginControllerProvider, LoginState>(
        (ref) {
  final authService = ref.read(authServiceProvider);

  return LoginControllerProvider(authService);
});
