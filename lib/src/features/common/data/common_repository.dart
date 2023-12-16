import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/data/responses/my_event_response.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/services/remote/dio_client.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';

class CommonRepository {
  final DioClient _dioClientTmdb;
  CommonRepository(this._dioClientTmdb);

  Future<Result<List<EventResponse>>> fetchEvents() async {
    try {
      final result = await _dioClientTmdb.get("/api/events");
      final resultBody = result['body']['body'];

      final eventList = resultBody
          .map<EventResponse>((e) => EventResponse.fromJson(e))
          .toList();

      return Result.success(eventList);
    } catch (e, st) {
      print("err ${e}");
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<MyEventResponse>> fetchMyEvents(String token) async {
    try {
      final result = await _dioClientTmdb.get(
        '/api/events/my-events',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final resultBody = result['body']['body'];
      final user = MyEventResponse.fromJson(resultBody);
      return Result.success(user);
    } catch (e, st) {
      print("err ${e}");
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository(ref.read(dioClientProvider));
});
