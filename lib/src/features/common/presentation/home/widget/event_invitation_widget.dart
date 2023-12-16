import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

class EventInvitationWidget extends StatelessWidget {
  const EventInvitationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160.h,
          width: MediaQuery.of(context).size.width * (0.9),
          padding: const EdgeInsets.only(left: 24, right: 24),
          margin: const EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            color: ColorApp.blue.withOpacity(0.4),
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite Your Friends',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: ColorApp.black,
                ),
              ),
              Gap.h8,
              Text(
                'Get \$10 for ticket',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: ColorApp.black.withOpacity(0.7),
                ),
              ),
              Gap.h16,
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * (0.22),
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap.w8,
                      const Icon(
                        Icons.share,
                        color: ColorApp.black,
                        size: 18,
                      ),
                      Gap.w8,
                      Text(
                        'Invite',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: ColorApp.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 190.h,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/invite_bg.png'),
              fit: BoxFit.scaleDown,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
        ),
      ],
    );
  }
}
