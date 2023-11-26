import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/themes/color_app.dart';
// import 'package:setiket/src/common_widgets/common_widgets.dart';
// import 'package:setiket/src/features/auth/presentation/login/login_controller.dart';

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = ref.read(loginControllerProvider.notifier);
    // final state = ref.watch(loginControllerProvider);
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        decoration: BoxDecoration(
            color: Color(0xFF3D56F0),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFC8CCDE),
                blurRadius: 35,
                offset: const Offset(0, 10),
              ),
            ]),
        child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                child: Center(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: ColorApp.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
              ),
            )),
      )
    ]);
  }
}
