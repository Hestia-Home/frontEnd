import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hestia/core/navigation/app_router/app_router.dart';
import 'package:hestia/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:hestia/feature/auth/data/repository/local_repository.dart';
import 'package:hestia/feature/auth/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/main/data/data_source/database/db.dart';
import 'package:hestia/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/main/data/data_source/local_data_source/local_data_source.dart';
import 'package:hestia/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:hestia/feature/main/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:hestia/feature/main/data/repository/local_repository.dart';
import 'package:hestia/feature/main/data/repository/remote_repository.dart';
import 'package:hestia/feature/main/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/main/domain/repository/i_remote_repository.dart';
import 'package:hestia/main.dart';
import 'package:local_auth/local_auth.dart';

class ServiceLocator {
  static late ServiceLocator instance;
  ServiceLocator._();

  late final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  late final AppRouter _appRouter = AppRouter();

  late final LocalAuthentication _localAuth = LocalAuthentication();

  late final myApp = App(appRouter: _appRouter);

  late final ILocalRepositoryAuth localRepositoryAuth =
      LocalRepositoryAuth(localDataSource: localDataSource);

  late final ILocalDataSourceAuth localDataSource = LocalDataSourceAuth(
    authentication: _localAuth,
    secureStorage: _secureStorage,
  );

  static init() {
    instance = ServiceLocator._();
  }

  IRemoteRepository get remoteRepository => _remoteRepository;

  ILocalRepository get localRepositoryMain => _localRepositoryMain;

  late final RemoteRepository _remoteRepository =
      RemoteRepository(_remoteDataSource);

  late final IRemoteDataSource _remoteDataSource =
      RemoteDataSource(_localDataSource);

  late final ILocalRepository _localRepositoryMain =
      LocalRepository(_localDataSource);

  late final HestiaDB _hestiaDB = HestiaDB();

  late final ILocalDataSource _localDataSource = LocalDataSource(_hestiaDB);
}
