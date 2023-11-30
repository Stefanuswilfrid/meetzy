import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_controller.dart';
import 'package:meetzy/src/shared/button_widget.dart';
import 'package:meetzy/themes/color_app.dart';
// import 'package:setiket/src/common_widgets/common_widgets.dart';
// import 'package:setiket/src/features/auth/presentation/login/login_controller.dart';

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginControllerProvider.notifier);
    final state = ref.watch(loginControllerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.primary(
          text: 'SIGN IN',
          onTap: controller.login,
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}
