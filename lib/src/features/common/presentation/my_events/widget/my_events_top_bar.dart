import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/themes/color_app.dart';

class MyEventsTopBar extends StatelessWidget {
  const MyEventsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('My Events',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(24),
          fontWeight: FontWeight.w600,
          color: ColorApp.black,
        ));
  }
}
