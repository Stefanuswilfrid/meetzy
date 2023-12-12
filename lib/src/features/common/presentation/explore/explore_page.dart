import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_controller.dart';
import 'package:meetzy/src/features/common/presentation/explore/widget/explore_field_widget.dart';
import 'package:meetzy/src/features/common/presentation/explore/widget/search_list_widget.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(exploreControllerProvider.notifier);
    final state = ref.watch(exploreControllerProvider);
    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizeApp.w20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h64,
              Text(
                'Explore Events',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(26),
                  fontWeight: FontWeight.w700,
                  color: ColorApp.black,
                ),
              ),
              Gap.h20,
              ExploreFieldWidget(
                hintText: 'Search...',
                onChanged: (value) {
                  if (value == '') controller.getEvent();
                  // if (value.isNotEmpty) controller.getSearch(value);
                  controller.setSearch(value);
                },
              ),
              Gap.h12,
              Visibility(
                visible: state.query != '',
                child: Text(
                  'Results for  "${state.query}"',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w600,
                    color: ColorApp.black,
                  ),
                ),
              ),
              const SearchListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
