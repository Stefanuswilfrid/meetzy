import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/domain/request_login.dart';
import 'package:meetzy/src/features/auth/domain/request_register.dart';
import 'package:meetzy/src/services/remote/dio_client.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';
import 'package:meetzy/src/shared/api_response.dart';
import 'package:dio/dio.dart';

// const String baseUrl =
//     'http://localhost:3000'; // Replace with your actual base URL
// const _defaultConnectTimeout = Duration(seconds: 60);
// const _defaultReceiveTimeout = Duration(seconds: 60);

class AuthRepository {
  final DioClient _dioClient;
  // late Dio _dio;

  AuthRepository(this._dioClient);

  Future<Result<ApiResponse>> login(RequestLogin requestLogin) async {
    try {
      var response = await _dioClient.post(
        "/api/auth/login",
        data: requestLogin.toJson(),
      );
      return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }

  Future<Result<ApiResponse>> register(RequestRegister requestRegister) async {
    try {
      var response = await _dioClient.post(
        "/api/auth/register",
        data: requestRegister.toJson(),
      );
      return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, stackTrace) {
      print("Dio Error: $e");

      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioClientProvider);

  return AuthRepository(dio);
});
