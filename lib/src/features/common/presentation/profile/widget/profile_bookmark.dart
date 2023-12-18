import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/shared/loading_widget.dart';

class ProfileBookmark extends ConsumerStatefulWidget {
  const ProfileBookmark({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileBookmarkState();
}

class _ProfileBookmarkState extends ConsumerState<ProfileBookmark> {
  // ProfileController get controller =>
  //     ref.read(profileControllerProvider.notifier);
  // ProfileState get state => ref.watch(profileControllerProvider);

  // @override
  // void didChangeDependencies() {
  //   safeRebuild(() {
  //     controller.getBookmarkEvents();
  //   });
  //   super.didChangeDependencies();
  // }

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
            style: TypographyApp.headline3,
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
