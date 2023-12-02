import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/common_widgets/async_value/async_value_widget.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

class EventTitleContentWidget extends StatelessWidget {
  final String title;
  final String? routes;

  const EventTitleContentWidget({
    required this.title,
    this.routes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: ColorApp.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              InkWell(
                onTap: routes != null
                    ? () => context.pushNamed(routes.toString())
                    : null,
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Palette.colorGray,
                    fontSize: 18.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        Gap.h24,
      ],
    );
  }
}
