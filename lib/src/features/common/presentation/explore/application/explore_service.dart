import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/features/common/presentation/explore/data/explore_repository.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';

class ExploreService {
  final ExploreRepository _exploreRepository;

  ExploreService(this._exploreRepository);

  Future<Result<List<Event>>> getSearch(String query) async {
    final resultEvents = await _exploreRepository.getSearch(query);
    print("search ${resultEvents}");
    return resultEvents.when(
      success: (data) {
        List<Event> event = [...data.map((e) => Event.fromResponse(e))];
        return Result.success(
          event,
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<List<Event>>> getEvents() async {
    final resultEvents = await _exploreRepository.getEvents();
    return resultEvents.when(
      success: (data) {
        List<Event> event = [...data.map((e) => Event.fromResponse(e))];
        return Result.success(
          event,
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<List<Event>>> getSearchByFilter({
    String? category,
    String? location,
    String? startDate,
    String? endDate,
  }) async {
    final resultEvents = await _exploreRepository.getSearchByFilter(
        category, location, startDate, endDate);

    return resultEvents.when(
      success: (data) {
        List<Event> event = [...data.map((e) => Event.fromResponse(e))];
        return Result.success(
          event,
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
    // return SearchMapper.mapToEvent(resultEvents);
  }
}

final exploreServiceProvider = Provider<ExploreService>((ref) {
  final searchRepository = ref.read(exploreRepositoryProvider);
  return ExploreService(searchRepository);
});
