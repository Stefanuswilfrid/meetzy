import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/gen/assets.gen.dart';
import 'package:meetzy/src/common_widgets/card_event/card_event_widget.dart';
import 'package:meetzy/src/common_widgets/padding/padding_widget.dart';
import 'package:meetzy/src/common_widgets/top_bar/top_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/checkout/widget/item_row_widget.dart';
import 'package:meetzy/src/features/common/presentation/ticket_detail/ticket_detail_controller.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/src/shared/extensions/date_time.dart';
import 'package:meetzy/src/shared/extensions/number.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/size_app.dart';

import '../../../../../common_widgets/detail_row/detail_row_widget.dart';

class TicketDetailContentSection extends ConsumerWidget {
  const TicketDetailContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketDetailControllerProvider);
    final detailTicket = state.ticket!;
    final detailEvent = detailTicket.event!;
    return PaddingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.h48,
          const TopBarWidget(title: "Ticket Information"),
          Gap.h32,
          CardEventWidget(detailTicket.event!),
          Gap.h20,
          Text(
            'Ticket Details',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              fontWeight: FontWeight.w700,
              color: ColorApp.black,
            ),
          ),
          Gap.h16,
          DetailRowWidget.icon(
            prefix: Assets.icons.icCalendar.svg(),
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
              ),
            ),
          ),
          Gap.h16,
          DetailRowWidget.icon(
            prefix: Assets.icons.icLocation.svg(),
            title: Text(
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
            prefix: Assets.images.eoDummy.image(fit: BoxFit.cover),
            title: Text(
              'Ashfak Sayem',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.bold,
                color: ColorApp.black,
              ),
            ),
            description: Text('Organizer',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w400,
                  color: ColorApp.gray,
                )),
          ),
          Gap.h32,
          Text(
            'Summary',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              fontWeight: FontWeight.w700,
              color: ColorApp.black,
            ),
          ),
          Gap.h16,
          ItemRowWidget.subHeading(
            title: 'Sub-total',
            value:
                '${detailEvent.ticketPrice.currency} x ${detailTicket.quantity}',
          ),
          Gap.h8,
          ItemRowWidget.heading(
              title: 'Total', value: detailTicket.price.currency),
          Gap.customGapHeight(context.screenHeightPercentage(.15)),
        ],
      ),
    );
  }
}
