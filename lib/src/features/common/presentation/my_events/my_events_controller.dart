import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/presentation/my_events/my_events_state.dart';

class MyEventsController extends StateNotifier<MyEventsState> {
  MyEventsController() : super(const MyEventsState());

  void setUpcoming(bool isUpcoming) {
    state = state.copyWith(
        isUpcomingEventsActive: isUpcoming, isPastEventsActive: !isUpcoming);
  }
}

final myEventsControllerProvider =
    StateNotifierProvider<MyEventsController, MyEventsState>((ref) {
  return MyEventsController();
});
