import 'package:elementary/elementary.dart';
import 'package:hestia/core/redux/state/state.dart';
import 'package:hestia/feature/main/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/main/domain/repository/i_remote_repository.dart';
import 'package:hestia/services_starter.dart';

abstract interface class IMainModel extends ElementaryModel {
  AppStore get store;
}

class MainModel extends ElementaryModel implements IMainModel {
  final ILocalRepository locaRepository;
  final IRemoteRepository remoteRepository;

  @override
  AppStore get store => servicesStarter.store;

  MainModel({
    required this.locaRepository,
    required this.remoteRepository,
  }) : super(
          errorHandler: DefaultDebugErrorHandler(),
        );
}
