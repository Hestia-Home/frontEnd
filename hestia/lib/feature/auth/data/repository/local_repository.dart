import 'package:hestia/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/auth/domain/repository/i_local_repository.dart';

class LocalRepositoryAuth implements ILocalRepositoryAuth {
  final ILocalDataSourceAuth _localDataSource;

  const LocalRepositoryAuth({required ILocalDataSourceAuth localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<bool> authenticate() async {
    return await _localDataSource.authenticate();
  }

  @override
  Future<String> getAccessToken() async =>
      await _localDataSource.getAccessToken();

  @override
  Future<String> getRefreshToken() async =>
      await _localDataSource.getRefreshToken();

  @override
  Future<void> saveAccessToken(String accessToken) async =>
      await _localDataSource.saveAccessToken(accessToken);

  @override
  Future<void> saveRefreshToken(String refreshToken) async =>
      await _localDataSource.saveRefreshToken(refreshToken);
}
