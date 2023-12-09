import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/domain/request_login.dart';
import 'package:meetzy/src/features/auth/domain/request_register.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';
import 'package:meetzy/src/shared/api_response.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

const String baseUrl =
    'http://localhost:3000'; // Replace with your actual base URL
const _defaultConnectTimeout = Duration(seconds: 60);
const _defaultReceiveTimeout = Duration(seconds: 60);

class AuthRepository {
  // final DioClient _dioClient;
  late Dio _dio;

  AuthRepository() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _defaultConnectTimeout,
      receiveTimeout: _defaultReceiveTimeout,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ));
  }

  Future<Result<ApiResponse>> login(RequestLogin requestLogin) async {
    try {
      print("rr ${requestLogin.toJson()}");
      var response = await _dio.post(
        "/api/auth/login",
        data: requestLogin.toJson(),
      );
      print("rd ${response.data}");
      return Result.success(ApiResponse.fromJson(response.data['body']));

      // return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }

  Future<Result<ApiResponse>> register(RequestRegister requestRegister) async {
    try {
      print("rr ${requestRegister.toJson()}");
      var response = await _dio.post(
        "/api/auth/register",
        data: requestRegister.toJson(),
      );
      print("rd ${response.data}");
      return Result.success(ApiResponse.fromJson(response.data['body']));
      // final response = await _dioClient.post(
      //   "/api/auth/register",
      //   data: requestRegister.toJson(),
      // );

      // return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, stackTrace) {
      print("Dio Error: $e");

      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
