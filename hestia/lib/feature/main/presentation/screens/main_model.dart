import 'package:elementary/elementary.dart';
import 'package:hestia/feature/main/domain/repository/i_local_repository.dart';
import 'package:hestia/feature/main/domain/repository/i_remote_repository.dart';

class MainModel extends ElementaryModel {
  final ILocalRepository locaRepository;
  final IRemoteRepository remoteRepository;

  MainModel({
    required this.locaRepository,
    required this.remoteRepository,
  }) : super(
          errorHandler: DefaultDebugErrorHandler(),
        );
}
