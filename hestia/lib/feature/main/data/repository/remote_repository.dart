import 'package:hestia/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:hestia/feature/main/domain/repository/i_remote_repository.dart';

class RemoteRepository implements IRemoteRepository {
  final IRemoteDataSource _remoteDataSource;
  const RemoteRepository(this._remoteDataSource);

  @override
  void setTargetTemperatureInWeatherStation(double targetTemperature) {
    _remoteDataSource.setTargetTemperatureInWeatherStation(targetTemperature);
  }

  @override
  void dispose() => _remoteDataSource.dispose();
}
