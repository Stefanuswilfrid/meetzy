import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/features/common/presentation/home/home_controller.dart';
import 'package:meetzy/src/features/common/presentation/home/widget/event_invitation_widget.dart';
import 'package:meetzy/src/features/common/presentation/home/widget/event_title_content_widget.dart';
import 'package:meetzy/src/features/common/presentation/home/widget/home_banner_widget.dart';
import 'package:meetzy/src/shared/extensions/build_context.dart';
import 'package:meetzy/themes/size_app.dart';

import 'widget/home_event_content_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
    final eventList = state.eventListItems;
    print("is null? ${eventList}");
    return StatusBarWidget(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBannerWidget(),
            Gap.customGapHeight(MediaQuery.of(context).size.height * 0.04),
            const EventTitleContentWidget(title: 'Upcoming Events'),
            HomeEventContentSection(eventList: eventList),
            Gap.customGapHeight(context.screenHeightPercentage(.03)),
            const EventInvitationWidget(),
          ],
        ),
      ),
    ));
  }
}
