import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/features/auth/presentation/register/register_controller.dart';
import 'package:meetzy/shared/dropdown_form_widget.dart';
import 'package:meetzy/shared/input_form_widget.dart';

class RegisterFormSection extends ConsumerWidget {
  const RegisterFormSection({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);

    final controller = ref.read(registerControllerProvider.notifier);

    return SingleChildScrollView(
        child: Form(
      key: state.formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign Up",
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
            const SizedBox(height: 16),
            InputFormWidget(
              controller: controller.nameController,
              onChanged: (value) {},
              hintText: 'Full name',
              prefixIcon: Icons.person_outline_rounded,
              validator: controller.validateName,
            ),
            const SizedBox(height: 16),
            InputFormWidget.password(
              controller: controller.passwordController,
              onChanged: (value) {},
              hintText: 'Your Password',
              isObscure: state.isObscure,
              prefixIcon: Icons.lock_outline,
              onObscureTap: controller.onObscureTap,
              validator: controller.validatePassword,
            ),
            const SizedBox(height: 16),
            InputFormWidget.password(
              controller: controller.passwordConfirmController,
              onChanged: (value) {},
              hintText: 'Confirm Password',
              isObscure: state.isObscureConfirm,
              prefixIcon: Icons.lock_outline,
              onObscureTap: controller.onObscureConfirmTap,
              validator: controller.validatePasswordConfirm,
            ),
            const SizedBox(height: 16),
            DropdownFormWidget(
              value: state.roleValue,
              list: state.roles,
              prefixIcon: Icons.person_outline_rounded,
              onChanged: (value) {
                if (value != null) {
                  controller.onRoleValueChanged(value);
                }
              },
            ),
            const SizedBox(height: 16),
          ]),
    ));
  }
}
