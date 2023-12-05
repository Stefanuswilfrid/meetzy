import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

class SearchEventCardWidget extends StatelessWidget {
  final Event event;
  const SearchEventCardWidget({
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => context.pushNamed(
      //   Routes.eventDetail.name,
      //   extra: Extras(
      //     datas: {
      //       ExtrasKey.id: event.id,
      //     },
      //   ),
      // ),
      child: Container(
        margin: EdgeInsets.only(bottom: 30.h, right: 20.w),
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          boxShadow: [
            BoxShadow(
              color: Palette.colorGray.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
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
                  width: context.screenWidthPercentage(0.28),
                  height: context.screenHeightPercentage(0.14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(15.r),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                    width: context.screenWidthPercentage(0.28),
                    height: context.screenHeightPercentage(0.14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomLeft: Radius.circular(15.r),
                      ),
                    ),
                    child: const Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h12,
                  Text(
                    '${event.startDatetime}-${event.startDatetime}',
                    style: const TextStyle(
                      color: Palette.color,
                      fontSize: 12,
                    ),
                  ),
                  Gap.h8,
                  SizedBox(
                    width: context.screenWidthPercentage(0.44),
                    child: Text(
                      event.title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w600,
                        color: ColorApp.black,
                      ),
                    ),
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
