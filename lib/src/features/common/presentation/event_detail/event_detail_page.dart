import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/common_widgets/async_value/async_value_widget.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/event_detail_controller.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/event_detail_state.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/widget/event_detail_button_section.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/widget/event_detail_content_section.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  final String id;
  const EventDetailPage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  EventDetailController get controller =>
      ref.read(eventDetailControllerProvider.notifier);
  EventDetailState get state => ref.watch(eventDetailControllerProvider);

  @override
  void initState() {
    // safeRebuild(() {
    //   controller.getEventById(widget.id);
    // });
    void safeRebuild() async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getEventById(widget.id);
      });
    }

    safeRebuild();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      brightness: Brightness.light,
      child: Scaffold(
        body: AsyncValueWidget(
          value: state.eventValue,
          data: (data) {
            return const Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      EventDetailContentSection(),
                    ],
                  ),
                ),
                EventDetailButtonSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
