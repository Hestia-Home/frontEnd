import 'dart:convert';
import 'package:hestia/feature/main/data/data_source/database/db.dart';
import 'package:hestia/feature/main/domain/entity/temperature_sensor_entity.dart';

class TemperatureSensorModel extends TemperatureSensorEntity {
  const TemperatureSensorModel({
    required super.id,
    required super.temperature,
  });

  factory TemperatureSensorModel.fromJson(Map<String, dynamic> json) {
    return TemperatureSensorModel(
      id: json['data']['device_id'] as int,
      temperature: json['data']['temperature'] as double,
    );
  }

  factory TemperatureSensorModel.fromDB(Devices device) {
    final Map<String, dynamic> json = jsonDecode(device.data);
    return TemperatureSensorModel(
        id: device.id,
        temperature: double.tryParse(json['temperature'].toString()) ?? 0);
  }
}
