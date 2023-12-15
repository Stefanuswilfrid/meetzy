// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/features/auth/data/auth_repository.dart';
import 'package:meetzy/src/features/auth/domain/request_login.dart';
import 'package:meetzy/src/features/auth/domain/request_register.dart';
import 'package:meetzy/src/services/local/hive_service.dart';
import 'package:meetzy/src/services/remote/result.dart';

class AuthService {
  final AuthRepository _authRepository;
  final HiveService _hiveService;

  AuthService(
    this._authRepository,
    this._hiveService,
  );

  Future<Result<String?>> login(RequestLogin requestLogin) async {
    final result = await _authRepository.login(requestLogin);
    return result.when(
      success: (data) {
        _hiveService.saveToken(data.body['accessToken']);

        return const Result.success('Login Success!');
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> register(RequestRegister requestRegister) async {
    final result = await _authRepository.register(requestRegister);
    // print("rt ${result}");
    return result.when(
      success: (data) {
        return const Result.success('Register Success!');
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final hiveService = ref.read(hiveServiceProvider);
  return AuthService(authRepository, hiveService);
});
