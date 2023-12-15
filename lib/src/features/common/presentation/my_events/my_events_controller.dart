import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/application/common_service.dart';
import 'package:meetzy/src/features/common/presentation/my_events/my_events_state.dart';

class MyEventsController extends StateNotifier<MyEventsState> {
  final CommonService _commonService;
  MyEventsController(this._commonService) : super(const MyEventsState());

  void getMyEvents() async {
    state = state.copyWith(
      upcomingEventsValue: const AsyncLoading(),
      pastEventsValue: const AsyncLoading(),
    );
    final result = await _commonService.getMyEvents();
  }

  void setUpcoming(bool isUpcoming) {
    state = state.copyWith(
        isUpcomingEventsActive: isUpcoming, isPastEventsActive: !isUpcoming);
  }
}

final myEventsControllerProvider =
    StateNotifierProvider<MyEventsController, MyEventsState>((ref) {
  final commonService = ref.read(commonServiceProvider);

  return MyEventsController(commonService);
});
