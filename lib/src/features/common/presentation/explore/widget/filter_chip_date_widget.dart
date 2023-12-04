import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return FilterChip(
      label: Text(
        name.capitalize,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(16),
          fontWeight: FontWeight.w500,
          color: ColorApp.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(color: Palette.colorGray.withOpacity(0)),
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
      selected: false,
      onSelected: (bool value) {
        // controller.setDateFilter(value ? name.toUpperCase() : '');
      },
    );
  }
}
