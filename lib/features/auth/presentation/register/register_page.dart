import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/features/auth/presentation/register/widget/register_button_section.dart';
import 'package:meetzy/features/auth/presentation/register/widget/register_form_section.dart';
import 'package:meetzy/themes/color_app.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              Navigator.pop(context);
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
