import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/common_widgets/padding/padding_widget.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

class HomeBannerWidget extends StatelessWidget {
  // final HomeController controller;
  const HomeBannerWidget(
      // this.controller, {
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: Palette.color[900],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(33.r),
              bottomRight: Radius.circular(33.r),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h32,
            PaddingWidget(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap.w40,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Current Location',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16),
                                  fontWeight: FontWeight.w600,
                                  color: ColorApp.white.withOpacity(0.7),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorApp.white.withOpacity(0.7),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeApp.w40,
                            ),
                            child: Text(
                              'Bandung',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                color: ColorApp.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: SizeApp.w40,
                            height: SizeApp.h40,
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                              color: Palette.colorWhite.withOpacity(0.2),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: ColorApp.white,
                                    size: SizeApp.h28,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 3,
                                      right: 5,
                                    ),
                                    child: Container(
                                      width: 10.w,
                                      height: 10.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30.r),
                                        ),
                                        color: ColorApp.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                  Gap.h32,
                  InkWell(
                    onTap: () {
                      // controller.setPage(1);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * (0.7),
                          height: SizeApp.h48,
                          padding: EdgeInsets.only(
                            left: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.r),
                            ),
                            color: Palette.colorWhite.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 1),
                                child: Icon(
                                  Icons.search,
                                  color: ColorApp.white,
                                  size: SizeApp.h36,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  'Search...',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    fontWeight: FontWeight.w600,
                                    color: ColorApp.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap.w12,
                        Container(
                            width: SizeApp.w40,
                            height: SizeApp.h40,
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                              color: Palette.colorWhite.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Icon(
                                Icons.filter_list,
                                color: ColorApp.white,
                                size: SizeApp.h28,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gap.customGapHeight(MediaQuery.of(context).size.height * (.04)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Gap.w24,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sports_basketball,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text(
                            'Sports',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.w600,
                              color: ColorApp.white,
                            ),
                          ),
                        ],
                      )),
                  Gap.w12,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.headset,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text(
                            'Music',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.w600,
                              color: ColorApp.white,
                            ),
                          ),
                        ],
                      )),
                  Gap.w12,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.fastfood_rounded,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text('Food',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.w600,
                                color: ColorApp.white,
                              )),
                        ],
                      )),
                  Gap.w12,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.computer,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text('Tech',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.w600,
                                color: ColorApp.white,
                              )),
                        ],
                      )),
                  Gap.w12,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
