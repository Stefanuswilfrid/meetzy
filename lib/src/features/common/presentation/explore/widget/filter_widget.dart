import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_controller.dart';
import 'package:meetzy/src/features/common/presentation/explore/widget/category_widget.dart';
import 'package:meetzy/src/features/common/presentation/explore/widget/filter_chip_date_widget.dart';
import 'package:meetzy/src/features/common/presentation/explore/widget/filter_chip_location_widget.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:meetzy/themes/size_app.dart';

class FilterWidget extends ConsumerWidget {
  final ScrollController scrollController;
  const FilterWidget({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreControllerProvider);
    final controller = ref.read(exploreControllerProvider.notifier);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeApp.w20),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h20,
            Center(
              child: Container(
                width: 50.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Palette.colorGray.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Gap.h20,
            Text(
              'Filter',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26),
                fontWeight: FontWeight.w700,
                color: ColorApp.black,
              ),
            ),
            Gap.h24,
            SizedBox(
              height: 170.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: CategoryEvent.values.length,
                itemBuilder: (context, index) => CategoryWidget(index: index),
              ),
            ),
            Text(
              'Time & Date',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
            Gap.h12,
            Row(
              children: [
                const FilterChipDateWidget(name: 'TODAY'),
                Gap.w16,
                const FilterChipDateWidget(name: 'TOMORROW'),
                Gap.w16,
                const FilterChipDateWidget(name: 'THIS WEEK'),
              ],
            ),
            Gap.h12,
            InkWell(
                onTap: () async {
                  final result = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                    initialDateRange: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now().add(
                        const Duration(days: 7),
                      ),
                    ),
                  );
                  if (result != null)
                  // controller.setPickDateFilter(
                  //     result.start.toYyyyMMDd, result.end.toYyyyMMDd)
                  {}
                },
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Palette.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Palette.colorWhite,
                        size: 20,
                      ),
                      Gap.w8,
                      Text(
                        'Choose from Calendar',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w400,
                          color: ColorApp.white,
                        ),
                      ),
                    ],
                  ),
                )),
            Gap.h36,
            Text(
              'Location',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                fontWeight: FontWeight.w600,
                color: ColorApp.black,
              ),
            ),
            Gap.h12,
            SizedBox(
              height: 120.h,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 10,
                ),
                itemCount: CityEvent.values.length,
                itemBuilder: (context, index) => FilterChipLocationWidget(
                  value: CityEvent.values[index],
                ), // CityEvent.values[index].value.capitalize
              ),
            ),
            Gap.h32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  height: SizeApp.h56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.colorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'RESET',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500,
                        color: ColorApp.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: SizeApp.h56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'APPLY',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500,
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap.h24
          ],
        ),
      ),
    );
  }
}
