import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class NoUpcomingEvent extends StatelessWidget {
  const NoUpcomingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/images/no-upcoming-event.svg'),
        Gap.h28,
        Text(
          'No Upcoming Event',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.w600,
            color: ColorApp.black,
          ),
        ),
        Gap.h12,
        Text(
          'Sorry, there are no upcoming events, please check again later.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w400,
            color: ColorApp.green,
          ),
        ),
      ],
    );
  }
}
