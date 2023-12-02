import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/features/common/presentation/home/home_page.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBotNavBarScreen extends ConsumerStatefulWidget {
  const HomeBotNavBarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeBotNavBarScreenState();
}

class _HomeBotNavBarScreenState extends ConsumerState<HomeBotNavBarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bucket = PageStorageBucket();

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: HomePage(),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10.sp),
          decoration: const BoxDecoration(color: ColorApp.white),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24.0.sp,
            // onTap: (index) => controller.setPage(index),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_home_active.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_explore_deactive.svg'),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_events_deactive.svg'),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_profile_deactive.svg'),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
