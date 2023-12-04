import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/common_widgets/snack_bar/snack_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/home/home_controller.dart';
import 'package:meetzy/src/shared/button_widget.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class ProfileContentSection extends ConsumerWidget {
  const ProfileContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
    return Center(
      child: Column(
        children: [
          Container(
            width: SizeApp.w96,
            height: SizeApp.h96,
            decoration: BoxDecoration(
              color: ColorApp.gray,
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: Assets.images.avatarDummy.provider(),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Gap.h16,
          Text(state.user?.displayName ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
              )),
          Gap.h16,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenHeightPercentage(.125),
            ),
            child: ButtonWidget.primary(
              text: 'Keluar',
              isEnabled: true,
              height: SizeApp.h64,
              color: ColorApp.red,
              onTap: () {
                // controller.logout();
                appSnackBar(context, ColorApp.green, 'Logout success');
              },
              padding: EdgeInsets.symmetric(
                horizontal: SizeApp.w16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
