import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/presentation/checkout/checkout_controller.dart';
import 'package:meetzy/src/shared/button_widget.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class CheckoutButtonSection extends ConsumerWidget {
  const CheckoutButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutControllerProvider);
    final controller = ref.read(checkoutControllerProvider.notifier);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.screenHeightPercentage(.2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeApp.w32,
          vertical: SizeApp.h24,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              ColorApp.white,
              ColorApp.white.withOpacity(0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget.primary(
              text: 'CHECKOUT',
              isEnabled: true,
              height: SizeApp.h72,
              onTap: controller.buyTicket,
              isLoading: state.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
