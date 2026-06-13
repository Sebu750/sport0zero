import 'package:dio/dio.dart';
import '../constants/app_constants.dart';

/// Central Dio HTTP client for the Sport0Zero backend API.
class ApiClient {
  late final Dio _dio;

  ApiClient({String? token}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Auth token interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final t = token;
          if (t != null && t.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $t';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Global error logging
          // ignore: avoid_print
          print('[ApiClient] ${error.requestOptions.method} '
              '${error.requestOptions.path} -> ${error.response?.statusCode}');
          return handler.next(error);
        },
      ),
    );

    // Logging interceptor (debug only)
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        logPrint: (obj) {
          // ignore: avoid_print
          print('[ApiClient] $obj');
        },
      ),
    );
  }

  Dio get dio => _dio;

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.get<T>(path, queryParameters: queryParameters);

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.post<T>(path, data: data, queryParameters: queryParameters);

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
  }) =>
      _dio.put<T>(path, data: data);

  Future<Response<T>> delete<T>(String path) => _dio.delete<T>(path);
}
