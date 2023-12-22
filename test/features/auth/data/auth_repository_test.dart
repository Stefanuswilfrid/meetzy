import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meetzy/src/features/auth/data/auth_repository.dart';
import 'package:meetzy/src/features/auth/data/responses/user_response.dart';
import 'package:meetzy/src/features/auth/domain/request_login.dart';
import 'package:meetzy/src/features/auth/domain/request_register.dart';
import 'package:meetzy/src/services/remote/network_exceptions.dart';
import 'package:meetzy/src/services/remote/result.dart';
import 'package:meetzy/src/shared/api_response.dart';
import 'package:mocktail/mocktail.dart';

import '../../service/remote/dio_clients_mock.dart';

// Create a mock implementation of DioClient
void main() {
  late ApiResponse apiResponseRegister;
  late ApiResponse apiResponseLogin;
  late UserResponse userResponse;
  late RequestRegister requestRegister;
  late RequestLogin requestLogin;
  late MockDioClient mockDioClient;
  late AuthRepository authRepository;

  setUp(() {
    requestRegister = RequestRegister(
      email: 'user@gmail.com',
      fullname: 'user',
      password: 'user12345678',
      role: 'USER',
    );
    userResponse = const UserResponse(
      id: "65768da2d84b9772dab479dd",
      email: 'admin@gmail.com',
      fullname: 'admin',
      role: RoleUser.user,
    );
    apiResponseRegister = ApiResponse(
      status: true,
      message: "string",
      body: userResponse,
    );

    requestLogin = RequestLogin(
      email: 'user@gmail.com',
      password: 'user12345678',
    );
    apiResponseLogin = const ApiResponse(
      status: true,
      message: "string",
      body: {"accessToken": "token"},
    );

    mockDioClient = MockDioClient();
    authRepository = AuthRepository(mockDioClient);
  });

  group('login', () {
    test('returns ApiResponse when response success', () async {
      // Expected result
      final expectedResult = Result.success(apiResponseLogin);

      // Stubbing the mockDioClient.post method
      when(
        () =>
            mockDioClient.post('/api/auth/login', data: requestLogin.toJson()),
      ).thenAnswer((_) => Future.value(apiResponseLogin.toJson()));

      // Actual result
      final actualResult = await authRepository.login(requestLogin);
      debugPrint(actualResult.toString());

      // Test
      expect(actualResult, expectedResult);
    });

    test('returns failure when response failed', () async {
      // Expected result
      Result<ApiResponse> expectedResult = const Result.failure(
        NetworkExceptions.badRequest(),
        StackTrace.empty,
      );

      // Stubbing the mockDioClient.post method
      when(
        () =>
            mockDioClient.post('/api/auth/login', data: requestLogin.toJson()),
      ).thenAnswer((_) => Future.value(expectedResult));

      // Actual result
      final actualResult = await authRepository.login(requestLogin);

      // Test
      expect(actualResult, isA<Result<ApiResponse>>());
    });
  });
  group('register', () {
    test('returns ApiResponse when response success', () async {
      // Expected result
      final expectedResult = Result.success(apiResponseRegister);

      // Stubbing the mockDioClient.post method
      when(
        () => mockDioClient.post('/api/auth/register',
            data: requestRegister.toJson()),
      ).thenAnswer((_) => Future.value(apiResponseRegister.toJson()));

      // Actual result
      final actualResult = await authRepository.register(requestRegister);
      debugPrint(actualResult.toString());

      // Test
      expect(actualResult, expectedResult);
    });

    test('returns failure when response failed', () async {
      // Expected result
      Result<ApiResponse> expectedResult = const Result.failure(
        NetworkExceptions.badRequest(),
        StackTrace.empty,
      );

      // Stubbing the mockDioClient.post method
      when(
        () => mockDioClient.post('/api/auth/register',
            data: requestRegister.toJson()),
      ).thenAnswer((_) => Future.value(expectedResult));

      // Actual result
      final actualResult = await authRepository.register(requestRegister);

      // Test
      expect(actualResult, isA<Result<ApiResponse>>());
    });
  });
}
