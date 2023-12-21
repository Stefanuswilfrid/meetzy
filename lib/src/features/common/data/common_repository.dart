import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/data/responses/user_response.dart';
import 'package:meetzy/src/features/common/data/responses/event_response.dart';
import 'package:meetzy/src/features/common/data/responses/my_event_response.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/features/common/domain/request_ticket.dart';
import 'package:meetzy/src/services/remote/dio_client.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';
import 'package:meetzy/src/shared/api_response.dart';

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

  Future<Result<UserResponse>> fetchProfile(String token) async {
    try {
      final result = await _dioClientTmdb.get(
        "/api/profile",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final resultBody = result['body']['body'];
      final user = UserResponse.fromJson(resultBody);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<EventResponse>> fetchDetail(String id) async {
    try {
      final result = await _dioClientTmdb.get('/api/events/$id');
      final resultBody = result['body']['body'];
      final event = EventResponse.fromJson(resultBody);
      return Result.success(event);
    } catch (e, st) {
      print("e ${e}");
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<ApiResponse>> postTicket(RequestTicket data) async {
    try {
      final response =
          await _dioClientTmdb.post("/api/tickets", data: data.toJson());

      return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, st) {
      print("err ${e}");
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository(ref.read(dioClientProvider));
});
