import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/features/common/presentation/home/home_controller.dart';
import 'package:meetzy/src/features/common/presentation/home/home_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_state.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBotNavBarScreen extends ConsumerStatefulWidget {
  const HomeBotNavBarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeBotNavBarScreenState();
}

class _HomeBotNavBarScreenState extends ConsumerState<HomeBotNavBarScreen> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);
  @override
  void initState() {
    void safeRebuild() async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getProfile();
        controller.setPage(0);
      });
    }

    safeRebuild();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bucket = PageStorageBucket();
    final currentIndex = state.currentIndex;
    final currentScreen = state.currentScreen;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10.sp),
          decoration: const BoxDecoration(color: ColorApp.white),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24.0.sp,
            currentIndex: currentIndex,
            onTap: (index) => controller.setPage(index),
            items: [
              BottomNavigationBarItem(
                icon: !state.isHomeActive
                    ? SvgPicture.asset('assets/icons/ic_home_deactive.svg')
                    : SvgPicture.asset('assets/icons/ic_home_active.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: !state.isExploreActive
                    ? SvgPicture.asset('assets/icons/ic_explore_deactive.svg')
                    : SvgPicture.asset('assets/icons/ic_explore_active.svg'),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: !state.isEventsActive
                    ? SvgPicture.asset('assets/icons/ic_events_deactive.svg')
                    : SvgPicture.asset('assets/icons/ic_events_active.svg'),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: !state.isProfileActive
                    ? SvgPicture.asset('assets/icons/ic_profile_deactive.svg')
                    : SvgPicture.asset('assets/icons/ic_profile_active.svg'),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
