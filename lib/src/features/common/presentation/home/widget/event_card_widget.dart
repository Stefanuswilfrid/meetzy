import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/event_detail_controller.dart';
import 'package:meetzy/src/routes/app_routes.dart';
import 'package:meetzy/src/routes/extras.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:intl/intl.dart';

import 'package:meetzy/themes/size_app.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventCardWidget extends ConsumerWidget {
  final Event event;
  const EventCardWidget({
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(eventDetailControllerProvider.notifier);
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.eventDetail.name,
        extra: Extras(
          datas: {
            'id': event.id,
          },
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h, right: 20.w),
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          boxShadow: [
            BoxShadow(
              color: Palette.colorGray.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: event.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                    width: context.screenWidthPercentage(0.55),
                    height: context.screenHeightPercentage(0.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10.h,
                          left: 10.w,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Palette.colorWhite.withOpacity(0.8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    event.startDatetime.day.toString(),
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(18),
                                      fontWeight: FontWeight.bold,
                                      color: ColorApp.red,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMMM')
                                        .format(event.startDatetime),
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: ColorApp.red,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: InkWell(
                            onTap: () {
                              controller.toggleBookmarkEventById(
                                  context, event.id, event);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: Palette.colorWhite.withOpacity(0.8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              child: controller.isBookmarkEvent(event.id)
                                  ? const Icon(
                                      Icons.bookmark_rounded,
                                      color: ColorApp.red,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.bookmark_border_rounded,
                                      color: ColorApp.gray,
                                      size: 20,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    )),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h12,
                  SizedBox(
                    width: context.screenWidthPercentage(0.44),
                    child: Text(
                      event.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        fontWeight: FontWeight.w600,
                        color: ColorApp.black,
                      ),
                    ),
                  ),
                  Gap.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Palette.colorGray,
                        size: 18,
                      ),
                      Gap.w4,
                      SizedBox(
                        width: context.screenWidthPercentage(0.44),
                        child: Text(
                          '${DateFormat('jm').format(event.startDatetime)} - ${DateFormat('jm').format(event.endDatetime)}',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Palette.colorGray.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Palette.colorGray,
                        size: 18,
                      ),
                      Gap.w4,
                      SizedBox(
                        width: context.screenWidthPercentage(0.44),
                        child: Text(
                            DateFormat('yMMMMd').format(event.startDatetime),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              color: Palette.colorGray.withOpacity(0.7),
                            )),
                      ),
                    ],
                  ),
                  Gap.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Palette.colorGray,
                        size: 18,
                      ),
                      Gap.w4,
                      SizedBox(
                        width: context.screenWidthPercentage(0.4),
                        child: Text(
                          event.city.toUpperCase(),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Palette.colorGray.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
