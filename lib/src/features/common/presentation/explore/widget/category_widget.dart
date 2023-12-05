import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_controller.dart';
import 'package:meetzy/src/shared/string.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

class CategoryWidget extends ConsumerWidget {
  final int index;
  const CategoryWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreControllerProvider);
    final controller = ref.read(exploreControllerProvider.notifier);
    return Container(
      margin: EdgeInsets.only(right: SizeApp.w24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () =>
                CategoryEvent.values[index].value == state.categoryFilter
                    ? controller.setCategoryFilter('')
                    : controller
                        .setCategoryFilter(CategoryEvent.values[index].value),
            child: Container(
              width: 84.w,
              height: 84.h,
              decoration: BoxDecoration(
                color: state.categoryFilter ==
                        CategoryEvent.values[index].value.toUpperCase()
                    ? Palette.color
                    : Palette.colorGray.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: state.categoryFilter ==
                        CategoryEvent.values[index].value.toUpperCase()
                    ? [
                        BoxShadow(
                            blurRadius: 35,
                            offset: const Offset(0, 10),
                            color: ColorApp.primary.withOpacity(.2))
                      ]
                    : [],
              ),
              child: Icon(CategoryEvent.values[index].value.filterIcon,
                  color: Palette.colorWhite, size: 50),
            ),
          ),
          Gap.h12,
          Text(CategoryEvent.values[index].value.capitalize,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
              ))
        ],
      ),
    );
  }
}
