import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/services/remote/dio_client.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';

class ExploreRepository {
  final DioClient _dioClientTmdb;
  ExploreRepository(this._dioClientTmdb);

  Future<Result<List<EventResponse>>> getSearch(String query) async {
    try {
      final result = await _dioClientTmdb.get("/api/events", queryParameters: {
        'search': query,
      });
      final resultBody = result['body']['body'];
      final eventList = resultBody
          .map<EventResponse>((e) => EventResponse.fromJson(e))
          .toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<List<EventResponse>>> getEvents() async {
    try {
      final result = await _dioClientTmdb.get("/api/events");

      final resultBody = result['body']['body'];

      final eventList = resultBody
          .map<EventResponse>((e) => EventResponse.fromJson(e))
          .toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<List<EventResponse>>> getSearchByFilter(
    String? category,
    String? location,
    String? startDate,
    String? endDate,
  ) async {
    try {
      Map<String, dynamic> queryParameters = {};
      if (category != null && category != '')
        queryParameters['category'] = category;
      if (location != null && location != '')
        queryParameters['location'] = location;
      if (startDate != null && startDate != '')
        queryParameters['date_gte'] = startDate;
      if (endDate != null && endDate != '')
        queryParameters['date_lte'] = endDate;
      final result = await _dioClientTmdb.get("/api/events",
          queryParameters: queryParameters);
      final resultBody = result['body']['body'];
      final eventList = resultBody
          .map<EventResponse>((e) => EventResponse.fromJson(e))
          .toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final exploreRepositoryProvider = Provider<ExploreRepository>((ref) {
  return ExploreRepository(ref.read(dioClientProvider));
});
