import 'dart:convert';
import 'package:hestia/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'dart:developer' as dev;

import 'package:ws/ws.dart';

class RemoteDataSource implements IRemoteDataSource {
  final WebSocketClient _channel;
  final ILocalDataSource _localDataSource;
  RemoteDataSource({
    required ILocalDataSource localDataSource,
    required String url,
  })  : _localDataSource = localDataSource,
        _channel = WebSocketClient.connect(url) {
    _channel.stream.listen((event) {
      try {
        Map<String, dynamic> json = jsonDecode(event.toString());
        _localDataSource.createOrUpdateRoomInfo(json['room']);
        _localDataSource.createOrUpdateDeviceInfo(json);
      } catch (e) {
        dev.log(e.toString());
        Exception(e.toString());
      }
    });
  }

  @override
  void setTargetTemperatureInWeatherStation(double targetTemperature) {
    final data = {
      "weather_station": "weather_station",
      "targer_temperature": targetTemperature
    };
    _channel.add(data);
  }

  @override
  void dispose() => _channel.close();
}
