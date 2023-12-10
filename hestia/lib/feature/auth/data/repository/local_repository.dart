import 'package:hestia/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/auth/domain/repository/i_local_repository.dart';

class LocalRepositoryAuth implements ILocalRepositoryAuth {
  final ILocalDataSourceAuth localDataSource;

  const LocalRepositoryAuth({required this.localDataSource});

  @override
  Future<bool> authenticate() async {
    return await localDataSource.authenticate();
  }

  @override
  Future<String> getAccessToken() async =>
      await localDataSource.getAccessToken();

  @override
  Future<String> getRefreshToken() async =>
      await localDataSource.getRefreshToken();

  @override
  Future<void> saveAccessToken(String accessToken) async =>
      await localDataSource.saveAccessToken(accessToken);

  @override
  Future<void> saveRefreshToken(String refreshToken) async =>
      await localDataSource.saveRefreshToken(refreshToken);
}
