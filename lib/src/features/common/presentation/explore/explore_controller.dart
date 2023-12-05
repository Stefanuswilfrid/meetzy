import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/application/common_service.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_state.dart';

class ExploreController extends StateNotifier<ExploreState> {
  final CommonService _commonService;

  ExploreController(this._commonService) : super(const ExploreState()) {
    getSearch('');
  }

  void setSearch(String query) {
    state = state.copyWith(query: query);
  }

  void clearSearch() {
    state = state.copyWith(query: '');
  }

  void getEvent() async {
    state = state.copyWith(
      eventValue: const AsyncLoading(),
    );
    final result = await _commonService.fetchAllEvents();
    state = state.copyWith(event: result);
  }

  void getSearch(String query) async {
    state = state.copyWith(
      eventValue: const AsyncLoading(),
    );
    // final result = await _searchService.getSearch(query);
    // result.when(
    //   success: (data) {
    //     state = state.copyWith(
    //       event: data,
    //       eventValue: AsyncData(data),
    //     );
    //   },
    //   failure: (error, stackTrace) {
    //     state = state.copyWith(eventValue: AsyncError(error, stackTrace));
    //   },
    // );
  }

  // void getSearchByFilter() async {
  //   state = state.copyWith(
  //     eventValue: const AsyncLoading(),
  //   );

  //   String startDate = '';
  //   if (state.startDateFilter != '' && state.startDateFilter != null)
  //     startDate = state.startDateFilter!;
  //   if (state.startDateFilter == 'TODAY') startDate = DateTime.now().toYyyyMMDd;
  //   if (state.startDateFilter == 'TOMORROW')
  //     startDate = DateTime.now().add(const Duration(days: 1)).toYyyyMMDd;
  //   if (state.startDateFilter == 'THIS WEEK')
  //     startDate = DateTime.now().toYyyyMMDd;

  //   String endDate = '';
  //   if (state.endDateFilter != '' && state.endDateFilter != null)
  //     endDate = state.endDateFilter!;
  //   if (state.endDateFilter == 'TODAY') endDate = DateTime.now().toYyyyMMDd;
  //   if (state.endDateFilter == 'TOMORROW')
  //     endDate = DateTime.now().add(const Duration(days: 1)).toYyyyMMDd;
  //   if (state.endDateFilter == 'THIS WEEK')
  //     endDate = DateTime.now().add(const Duration(days: 7)).toYyyyMMDd;

  //   final result = await _searchService.getSearchByFilter(
  //     category: state.categoryFilter,
  //     location: state.locationFilter,
  //     startDate: startDate,
  //     endDate: endDate,
  //   );
  //   result.when(
  //     success: (data) {
  //       state = state.copyWith(
  //         event: data,
  //         eventValue: AsyncData(data),
  //       );
  //     },
  //     failure: (error, stackTrace) {
  //       state = state.copyWith(eventValue: AsyncError(error, stackTrace));
  //     },
  //   );
  // }

  void clearFilter() {
    getSearch('');
    state = state.copyWith(
      categoryFilter: '',
      locationFilter: '',
      startDateFilter: '',
      endDateFilter: '',
    );
  }

  void setCategoryFilter(String category) {
    state = state.copyWith(categoryFilter: category.toUpperCase());
  }

  void setDateFilter(String? startDate) {
    state =
        state.copyWith(startDateFilter: startDate, endDateFilter: startDate);
  }

  void setPickDateFilter(String? startDate, String? endDate) {
    state = state.copyWith(
      startDateFilter: startDate,
      endDateFilter: endDate,
    );
  }

  void setLocationFilter(String location) {
    state = state.copyWith(locationFilter: location.toUpperCase());
  }
}

final exploreControllerProvider =
    StateNotifierProvider<ExploreController, ExploreState>((ref) {
  // final searchService = ref.read(searchServiceProvider);
  final commonService = ref.read(commonServiceProvider);

  return ExploreController(commonService);
});
