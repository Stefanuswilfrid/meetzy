import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_controller.dart';
import 'package:meetzy/src/shared/button_widget.dart';

class RegisterButtonSection extends ConsumerWidget {
  const RegisterButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    bool isLoading = state.isLoading; // Create isLoading variable

    final controller = ref.read(registerControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.primary(
          text: 'SIGN UP',
          onTap: controller.register,
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}
