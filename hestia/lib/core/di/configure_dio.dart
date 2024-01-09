import 'package:dio/dio.dart';
import 'package:hestia/core/common/interceptors/auth_interceptor.dart';
import 'package:hestia/core/common/utils/urls.dart';
import 'package:hestia/feature/auth/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/auth/domain/repository/i_remote_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<Dio> configureDio(
  IRemoteRepositoryAuth Function(Dio) authRepository,
  ILocalRepositoryAuth localAuthRepository,
) async {
  final Dio dio = Dio();
  const timeout = Duration(seconds: 30);
  dio.options
    ..baseUrl = Urls.baseUrl
    ..contentType = Headers.formUrlEncodedContentType
    ..connectTimeout = timeout
    ..sendTimeout = timeout
    ..receiveTimeout = timeout;

  dio.interceptors.add(PrettyDioLogger());

  final refreshToken = await localAuthRepository.getRefreshToken();
  final accessToken = await localAuthRepository.getAccessToken();

  final authInterceptor = AuthInterceptor(
    authRepository: authRepository(dio),
    dio: dio,
    accessToken: accessToken,
    refreshToken: refreshToken,
  );

  dio.interceptors.add(authInterceptor);
  await authInterceptor.init();

  return dio;
}
