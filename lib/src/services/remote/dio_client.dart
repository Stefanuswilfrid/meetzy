import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetzy/src/services/local/hive_service.dart';

const _defaultConnectTimeout = Duration(seconds: 60);
const _defaultReceiveTimeout = Duration(seconds: 60);

class DioClient {
  final String baseUrl;

  late Dio _dio;

  final HiveService hiveService;

  DioClient({
    required Dio dio,
    required this.baseUrl,
    required this.hiveService,
  }) {
    final token = hiveService.getToken();

    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
  }

  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get<T>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = Dio();
  // final httpClient = HttpClient();
  final baseUrl = dotenv.get('BASE_URL');
  final hiveService = ref.read(hiveServiceProvider);
  return DioClient(
    baseUrl: baseUrl,
    dio: dio,
    // httpClient: httpClient,
    hiveService: hiveService,
  );
});
