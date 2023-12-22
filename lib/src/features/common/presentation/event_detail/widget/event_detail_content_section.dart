import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:meetzy/src/common_widgets/detail_row/detail_row_widget.dart';
import 'package:meetzy/src/common_widgets/padding/padding_widget.dart';
import 'package:meetzy/src/common_widgets/top_bar/top_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/event_detail_controller.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/widget/bookmark_widget.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/widget/quantity_widget.dart';
import 'package:meetzy/src/shared/button_widget.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/src/shared/extensions/date_time.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

class EventDetailContentSection extends ConsumerWidget {
  const EventDetailContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(eventDetailControllerProvider.notifier);
    final state = ref.watch(eventDetailControllerProvider);
    final detailEvent = state.event!;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: detailEvent.imageUrl,
          imageBuilder: (context, imageProvider) => Image(
            image: imageProvider,
            width: context.screenWidthPercentage(1),
            height: context.screenHeightPercentage(.3),
            fit: BoxFit.fitWidth,
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Image.network(
          detailEvent.imageUrl,
          width: context.screenWidthPercentage(1),
          height: context.screenHeightPercentage(.3),
          fit: BoxFit.fitWidth,
        ),
        Container(
          height: context.screenHeightPercentage(.15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorApp.black.withOpacity(.6),
                ColorApp.black.withOpacity(0),
              ],
            ),
          ),
        ),
        PaddingWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h48,
              TopBarWidget(
                title: "Event Details",
                isDark: false,
                suffix: BookmarkWidget(
                  isBookmarked: state.isBookmarkEvent,
                  onTap: () {
                    controller.toggleBookmarkEvent(context);
                  },
                ),
              ),
              Gap.customGapHeight(context.screenHeightPercentage(.18)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeApp.w32),
                child: Container(
                  padding: EdgeInsets.all(SizeApp.w12),
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorApp.black.withOpacity(.1),
                        blurRadius: 20,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/participant_dummy.png'),
                          Gap.w12,
                          Text(
                            '+${detailEvent.capacity - detailEvent.remainingCapacity} Going',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.w400,
                              color: ColorApp.primary,
                            ),
                          ),
                        ],
                      ),
                      ButtonWidget.primary(
                        text: 'Invite',
                        isEnabled: true,
                        height: SizeApp.h36,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeApp.w12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap.h20,
              Text(
                detailEvent.title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(26),
                  fontWeight: FontWeight.w700,
                  color: ColorApp.black,
                ),
              ),
              Gap.h24,
              DetailRowWidget.icon(
                prefix: SvgPicture.asset('assets/icons/ic_calendar.svg'),
                title: Text(
                  detailEvent.startDatetime.dateMonthYear,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w600,
                    color: ColorApp.black,
                  ),
                ),
                description: Text(
                    '${detailEvent.startDatetime.dayName}, ${detailEvent.startDatetime.time} - ${detailEvent.endDatetime.time}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w400,
                      color: ColorApp.gray,
                    )),
              ),
              Gap.h16,
              DetailRowWidget.icon(
                prefix: SvgPicture.asset('assets/icons/ic_money.svg'),
                title: Text(
                  // detailEvent.city.value.tocapitalize,
                  detailEvent.city,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w600,
                    color: ColorApp.black,
                  ),
                ),
                description: Text(
                  detailEvent.locationDetail,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w400,
                    color: ColorApp.gray,
                  ),
                ),
              ),
              Gap.h16,
              DetailRowWidget.image(
                prefix: Image.asset('assets/images/eo_dummy.jpeg',
                    fit: BoxFit.cover),
                title: Text(
                  'Olatunji',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.bold,
                    color: ColorApp.black,
                  ),
                ),
                description: Text(
                  'Organizer',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w400,
                    color: ColorApp.gray,
                  ),
                ),
              ),
              Gap.h24,
              Text(
                'About Event',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorApp.black,
                ),
              ),
              Gap.h8,
              Text(
                detailEvent.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.black,
                ),
              ),
              Gap.h24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket Price',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      fontWeight: FontWeight.w700,
                      color: ColorApp.black,
                    ),
                  ),
                  QuantityWidget(
                    quantity: state.quantity,
                    maxQuantity: detailEvent.remainingCapacity,
                    onMin: (newQuantity) => controller.setQuantity(newQuantity),
                    onPlus: (newQuantity) =>
                        controller.setQuantity(newQuantity),
                  )
                ],
              ),
              Gap.h16,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: SizeApp.w56,
                    height: SizeApp.h56,
                    padding: EdgeInsets.all(9.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Palette.colorRed.shade200,
                    ),
                    child: SvgPicture.asset('assets/icons/ic_money.svg'),
                  ),
                  Gap.w16,
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp',
                      decimalDigits: 0,
                    ).format(detailEvent.ticketPrice * state.quantity),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      fontWeight: FontWeight.w700,
                      color: ColorApp.red,
                    ),
                  ),
                ],
              ),
              Gap.customGapHeight(context.screenHeightPercentage(.15)),
            ],
          ),
        ),
      ],
    );
  }
}
