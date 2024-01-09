import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hestia/core/common/constants/constants.dart';
import 'package:hestia/core/di/configure_dio.dart';
import 'package:hestia/core/di/dependencies.dart';
import 'package:hestia/core/di/dependencies_provider.dart';
import 'package:hestia/core/navigation/app_router/app_router.dart';
import 'package:hestia/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:hestia/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:hestia/feature/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:hestia/feature/auth/data/repository/local_repository.dart';
import 'package:hestia/feature/auth/data/repository/remote_repository.dart';
import 'package:hestia/feature/auth/data/services/auth_service.dart';
import 'package:hestia/feature/auth/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/auth/domain/repository/i_remote_repository.dart';
import 'package:hestia/feature/main/data/data_source/database/db.dart';
import 'package:hestia/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/main/data/data_source/local_data_source/local_data_source.dart';
import 'package:hestia/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:hestia/feature/main/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:hestia/feature/main/data/repository/local_repository.dart';
import 'package:hestia/feature/main/data/repository/remote_repository.dart';
import 'package:hestia/feature/main/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/main/domain/repository/i_remote_repository.dart';
import 'package:hestia/feature/main/presentation/screens/main_screen_model.dart';
import 'package:hestia/main.dart';
import 'package:local_auth/local_auth.dart';

abstract interface class IDiContainer {
  Future<Widget> createApp();
}

final class DiContainer implements IDiContainer {
  late final Dio _dio;

  @override
  Future<Widget> createApp() async {
    _dio = await configureDio(_remoteRepositoryAuth, _localRepositoryAuth());

    return DependenciesProvider(
      dependencies: Dependencies(
        mainModel: _mainModel,
      ),
      child: App(appRouter: _appRouter),
    );
  }

  late final IMainModel _mainModel = MainModel(
    locaRepository: _localRepositoryMain,
    remoteRepository: _remoteRepository(),
  );

  late final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  late final AppRouter _appRouter = AppRouter();

  late final LocalAuthentication _localAuth = LocalAuthentication();

  ILocalRepositoryAuth _localRepositoryAuth() =>
      LocalRepositoryAuth(localDataSource: localDataSource);

  IRemoteRepositoryAuth _remoteRepositoryAuth(Dio dio) =>
      RemoteRepoistoryAuth(remoteDataSource: _remoteDataSourceAuth(dio));

  IRemoteDataSourceAuth _remoteDataSourceAuth(Dio dio) => RemoteDataSourceAuth(
        service: AuthService(dio),
        localRepository: _localRepositoryAuth(),
      );

  late final ILocalDataSourceAuth localDataSource = LocalDataSourceAuth(
    authentication: _localAuth,
    secureStorage: _secureStorage,
  );

  IRemoteRepository _remoteRepository() =>
      RemoteRepository(_remoteDataSource());

  IRemoteDataSource _remoteDataSource() => RemoteDataSource(
        localDataSource: _localDataSource(),
        url: Constants.webSocketUrl,
      );

  late final ILocalRepository _localRepositoryMain =
      LocalRepository(_localDataSource());

  late final HestiaDB _hestiaDB = HestiaDB();

  ILocalDataSource _localDataSource() => LocalDataSource(_hestiaDB);
}
