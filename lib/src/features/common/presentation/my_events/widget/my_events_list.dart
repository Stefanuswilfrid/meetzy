import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/common_widgets/card_event/card_event_widget.dart';
import 'package:meetzy/src/features/common/presentation/my_events/my_events_controller.dart';
import 'package:meetzy/themes/size_app.dart';

class MyEventsList extends ConsumerWidget {
  const MyEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myEventsControllerProvider);

    if (state.isUpcomingEventsActive) {
      return Column(
        children: [
          for (var ticket in state.upcomingEvents)
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CardEventWidget(ticket.event!),
                ),
                Gap.h20,
              ],
            ),
        ],
      );
    } else {
      return Column(
        children: [
          for (var ticket in state.pastEvents)
            Column(
              children: [
                GestureDetector(
                  child: CardEventWidget(ticket.event!),
                ),
                Gap.h20,
              ],
            ),
        ],
      );
    }
  }
}
