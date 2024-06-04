import 'dart:async';
import 'dart:convert';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:developer' as dev;

class RemoteDataSource implements IRemoteDataSource {
  final StreamController _channel;
  final ILocalDataSource _localDataSource;
  RemoteDataSource(this._localDataSource) : _channel = StreamController.broadcast() {
    _channel.add(
      {
        'room': {'id': 1, 'name': 'rest_room'},
        'device': {'id': 1, 'name': 'rest_room', 'is_on': true},
      },
    );
    _channel.stream.listen((event) {
      try {
        // Map<String, dynamic> json = jsonDecode(event.toString());
        _localDataSource.createOrUpdateRoomInfo(event['room']);
        _localDataSource.createOrUpdateDeviceInfo(event['device']);
      } catch (e) {
        dev.log(e.toString());
        Exception(e.toString());
      }
    });
  }

  @override
  void setTargetTemperatureInWeatherStation(double targetTemperature) {
    final data = {"weather_station": "weather_station", "targer_temperature": targetTemperature};
    _channel.sink.add(data);
  }

  @override
  void dispose() => _channel.sink.close();
}
