import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/themes/color_app.dart';

enum ItemRowype {
  heading,
  subHeading,
}

class ItemRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final ItemRowype itemRowype;

  const ItemRowWidget({
    super.key,
    required this.title,
    required this.value,
    required this.itemRowype,
  });

  const ItemRowWidget.heading({
    super.key,
    required this.title,
    required this.value,
  }) : itemRowype = ItemRowype.heading;

  const ItemRowWidget.subHeading({
    super.key,
    required this.title,
    required this.value,
  }) : itemRowype = ItemRowype.subHeading;

  TextStyle getTextStyle() => itemRowype == ItemRowype.heading
      ? TextStyle(
          fontSize: ScreenUtil().setSp(22),
          fontWeight: FontWeight.w700,
          color: ColorApp.black,
        )
      : TextStyle(
          fontSize: ScreenUtil().setSp(18),
          fontWeight: FontWeight.w600,
          color: ColorApp.black,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: getTextStyle()),
        Text(
          value,
          textAlign: TextAlign.right,
          style: getTextStyle().copyWith(color: ColorApp.red),
        )
      ],
    );
  }
}
