import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_controller.dart';
import 'package:meetzy/src/shared/string.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';

class FilterChipDateWidget extends ConsumerWidget {
  final String name;
  const FilterChipDateWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreControllerProvider);
    final controller = ref.read(exploreControllerProvider.notifier);
    return FilterChip(
      label: Text(
        name.capitalize,
        style: state.startDateFilter == name.toUpperCase()
            ? TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w500,
                color: ColorApp.white,
              )
            : TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w500,
                color: ColorApp.gray,
              ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: state.startDateFilter == name.toUpperCase()
              ? Palette.colorGray.withOpacity(0)
              : Palette.colorGray.withOpacity(0.2),
        ),
      ),
      backgroundColor: Palette.colorWhite,
      selectedColor: Palette.color,
      selectedShadowColor: Palette.color.withOpacity(0.2),
      labelStyle: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w400,
        color: ColorApp.black,
      ),
      checkmarkColor: Palette.colorWhite,
      selected: state.startDateFilter == name.toUpperCase(),
      onSelected: (bool value) {
        controller.setDateFilter(value ? name.toUpperCase() : '');
      },
    );
  }
}
