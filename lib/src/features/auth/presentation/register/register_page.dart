import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/common_widgets/snack_bar/snack_bar_widget.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_controller.dart';
import 'package:meetzy/src/features/auth/presentation/register/widget/register_button_section.dart';
import 'package:meetzy/src/features/auth/presentation/register/widget/register_form_section.dart';
import 'package:meetzy/src/routes/app_routes.dart';
import 'package:meetzy/themes/color_app.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prevState, state) {
      if (prevState?.registerValue != state.registerValue) {
        state.registerValue.whenOrNull(
          data: (message) {
            if (message != null) {
              // Navigator.of(context).removeRouteBelow(ModalRoute.of(context)!);

              // Navigator.pushNamed(context, "/login");
              context.goNamed(Routes.login.name);
            }
          },
          error: (e, stackTrace) {
            final message = state.errors?['message'];
            appSnackBar(context, ColorApp.red, "Error : $message");
          },
        );
      }
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      RegisterFormSection(),
                      RegisterButtonSection(),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: ColorApp.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              context.pop();
                            },
                            child: Text(
                              ' Sign In',
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
                    ]))));
  }
}
