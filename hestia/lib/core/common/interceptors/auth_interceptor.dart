import 'package:dio/dio.dart';
import 'package:hestia/feature/auth/domain/repository/i_remote_repository.dart';

class AuthInterceptor extends Interceptor {
  final IRemoteRepositoryAuth authRepository;
  final Dio _dio;

  String refreshToken;
  String accessToken;

  AuthInterceptor({
    required this.authRepository,
    required Dio dio,
    required this.accessToken,
    required this.refreshToken,
  }) : _dio = dio;

  Future<void> init() async {
    final tokens = await authRepository.refresh();
    accessToken = tokens.$1;
    refreshToken = tokens.$2;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['authorization'] = 'Bearer $accessToken';

    if (options.path == '/auth/refresh') {
      options.headers['authorization'] = 'Bearer $refreshToken';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (err.response?.statusCode == 401) {
        if (err.requestOptions.path != '/auth/refresh') {
          final tokens = await authRepository.refresh();
          accessToken = tokens.$1;
          refreshToken = tokens.$2;
        }
        final response = await _retry(err.requestOptions);

        handler.resolve(response);

        return;
      }
      handler.next(err);
    } catch (e) {
      handler.reject(err);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
