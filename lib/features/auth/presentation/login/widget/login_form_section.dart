import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/features/auth/presentation/login/login_controller.dart';
import 'package:meetzy/shared/input_form_widget.dart';

class LoginFormSection extends ConsumerWidget {
  const LoginFormSection({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    final controller = ref.read(loginControllerProvider.notifier);

    return SingleChildScrollView(
      child: Form(
        key: state.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            InputFormWidget(
              controller: controller.emailController,
              onChanged: (value) {},
              hintText: 'abc@gmail.com',
              prefixIcon: Icons.email_outlined,
              validator: controller.validateEmail,
            ),
            const SizedBox(height: 10),
            InputFormWidget.password(
              controller: controller.passwordController,
              onChanged: (value) {},
              hintText: 'Your Password',
              isObscure: state.isObscure,
              prefixIcon: Icons.lock_outline,
              onObscureTap: controller.onObscureTap,
              validator: controller.validatePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF120D26),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
