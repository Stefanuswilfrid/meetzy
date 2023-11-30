import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/common_widgets/padding/padding_widget.dart';
import 'package:meetzy/src/common_widgets/snack_bar/snack_bar_widget.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_controller.dart';
import 'package:meetzy/src/features/auth/presentation/login/widget/login_button_section.dart';
import 'package:meetzy/src/features/auth/presentation/login/widget/login_form_section.dart';
import 'package:meetzy/src/routes/app_routes.dart';
import 'package:meetzy/themes/color_app.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (prevState, state) {
      if (prevState?.loginValue != state.loginValue) {
        state.loginValue.whenOrNull(data: (data) {
          if (data != null) {}
        });
      }
      if (state.errors != null) {
        final message = state.errors?['message'];
        appSnackBar(context, ColorApp.red, "Error : $message");
      }
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: PaddingWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                  child: Image.asset(
                "assets/meetzy__logo.png",
                fit: BoxFit.fitWidth,
              )),
              LoginFormSection(),
              const SizedBox(
                height: 36,
              ),
              LoginButtonSection(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ColorApp.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, "/register");
                      context.pushNamed(Routes.register.name);
                    },
                    child: Text(
                      ' Sign Up',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF3D56F0),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        )));
  }
}
