import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/common_widgets/padding/padding_widget.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/profile/widget/profile_content_section.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatusBarWidget(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: PaddingWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap.h48,
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.w600,
                        color: ColorApp.black,
                      ),
                    ),
                    Gap.h28,
                    const ProfileContentSection(),
                    Gap.h28,
                    Text(
                      'Bookmark Events',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        fontWeight: FontWeight.w700,
                        color: ColorApp.black,
                      ),
                    ),
                    Gap.h12,
                    // const ProfileBookmark(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
