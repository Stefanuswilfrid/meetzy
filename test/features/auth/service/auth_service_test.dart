import 'package:flutter_test/flutter_test.dart';
import 'package:meetzy/src/features/auth/application/auth_service.dart';
import 'package:meetzy/src/features/auth/data/responses/user_response.dart';
import 'package:meetzy/src/features/auth/domain/request_login.dart';
import 'package:meetzy/src/features/auth/domain/request_register.dart';
import 'package:meetzy/src/services/remote/result.dart';
import 'package:meetzy/src/shared/api_response.dart';
import 'package:mocktail/mocktail.dart';

import '../../data_mocks.dart';
import '../../service/local/hive_service_mock.dart';

void main() {
  late ApiResponse apiResponseRegister;
  late ApiResponse apiResponseLogin;
  late UserResponse userResponse;
  late RequestRegister requestRegister;
  late RequestLogin requestLogin;
  late MockAuthRepository mockAuthRepository;
  late MockHiveService mockHiveService;
  late AuthService authService;

  setUp(() {
    requestRegister = RequestRegister(
      email: 'user@gmail.com',
      fullname: 'user',
      password: 'user12345678',
      role: 'USER',
    );
    userResponse = const UserResponse(
      id: "65768da2d84b9772dab498de",
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

    mockAuthRepository = MockAuthRepository();
    mockHiveService = MockHiveService();

    authService = AuthService(mockAuthRepository, mockHiveService);
  });

  group('login()', () {
    test('returns String when success', () async {
      Result<String?> expectedResult = const Result.success('Login Success!');

      when(
        () => mockAuthRepository.login(requestLogin),
      ).thenAnswer((_) => Future.value(Result.success(apiResponseLogin)));

      final actualResult = await authService.login(requestLogin);

      expect(actualResult, expectedResult);
    });
  });
  group('register()', () {
    test('returns String when success', () async {
      Result<String?> expectedResult =
          const Result.success('Register Success!');

      when(
        () => mockAuthRepository.register(requestRegister),
      ).thenAnswer((_) => Future.value(Result.success(apiResponseRegister)));

      final actualResult = await authService.register(requestRegister);

      expect(actualResult, expectedResult);
    });
  });
}
