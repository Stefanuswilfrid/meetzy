import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/common_widgets/async_value/async_value_widget.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_controller.dart';
import 'package:meetzy/src/features/common/presentation/explore/widget/search_event_card_widget.dart';

class SearchListWidget extends ConsumerWidget {
  const SearchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreControllerProvider);
    return AsyncValueWidget(
      value: state.eventValue,
      data: (value) {
        return value!.isNotEmpty
            ? ListView.builder(
                itemCount: value.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final event = value[index];
                  return SearchEventCardWidget(event: event);
                },
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250.h),
                  child: const Text('Event Not Found'),
                ),
              );
      },
    );
  }
}
