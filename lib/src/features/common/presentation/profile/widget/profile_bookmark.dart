import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/common_widgets/card_event/card_event_widget.dart';
import 'package:meetzy/src/features/common/presentation/profile/profile_controller.dart';
import 'package:meetzy/src/features/common/presentation/profile/profile_state.dart';
import 'package:meetzy/src/shared/loading_widget.dart';
import 'package:meetzy/themes/color_app.dart';

class ProfileBookmark extends ConsumerStatefulWidget {
  const ProfileBookmark({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileBookmarkState();
}

class _ProfileBookmarkState extends ConsumerState<ProfileBookmark> {
  ProfileController get controller =>
      ref.read(profileControllerProvider.notifier);
  ProfileState get state => ref.watch(profileControllerProvider);

  @override
  void didChangeDependencies() {
    // safeRebuild(() {
    //   controller.getBookmarkEvents();
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getBookmarkEvents();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (state.bookmarkEventListValue.hasError) {
        return const Center(
          child: Text('Error'),
        );
      } else if (state.isLoading) {
        return const Center(
          child: LoadingWidget(),
        );
      } else if (state.bookmarkEventList.isEmpty) {
        return Center(
          child: Text(
            'You haven\'t bookmarked any events yet, you bookmarked them first',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w600,
              color: ColorApp.black,
            ),
          ),
        );
      }
      return Column(
        children: [
          for (var bookmarkEvent in state.bookmarkEventList)
            CardEventWidget(bookmarkEvent),
        ],
      );
    });
  }
}
