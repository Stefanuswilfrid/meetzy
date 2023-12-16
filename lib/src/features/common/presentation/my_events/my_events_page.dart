import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/common_widgets/async_value/async_value_widget.dart';
import 'package:meetzy/src/common_widgets/padding/padding_widget.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/my_events/my_events_controller.dart';
import 'package:meetzy/src/features/common/presentation/my_events/my_events_state.dart';
import 'package:meetzy/src/features/common/presentation/my_events/widget/my_events_list.dart';
import 'package:meetzy/src/features/common/presentation/my_events/widget/my_events_status.dart';
import 'package:meetzy/src/features/common/presentation/my_events/widget/my_events_top_bar.dart';
import 'package:meetzy/src/features/common/presentation/my_events/widget/no_upcoming_event.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/size_app.dart';

class MyEventsPage extends ConsumerStatefulWidget {
  const MyEventsPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends ConsumerState<MyEventsPage> {
  MyEventsController get controller =>
      ref.read(myEventsControllerProvider.notifier);
  MyEventsState get state => ref.watch(myEventsControllerProvider);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getMyEvents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: PaddingWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap.h48,
                const MyEventsTopBar(),
                Gap.customGapHeight(context.screenHeightPercentage(.03)),
                const MyEventsStatus(),
                Gap.customGapHeight(context.screenHeightPercentage(.05)),
                AsyncValueWidget(
                  value: state.isUpcomingEventsActive
                      ? state.upcomingEventsValue
                      : state.pastEventsValue,
                  data: (data) {
                    if (data.isEmpty) {
                      return Column(
                        children: [
                          Gap.customGapHeight(
                              context.screenHeightPercentage(.1)),
                          const NoUpcomingEvent(),
                        ],
                      );
                    } else {
                      return const MyEventsList();
                    }
                  },
                ),

                // NoUpcomingEvent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
