import 'package:equatable/equatable.dart';
import 'package:hestia/feature/main/domain/entity/device.dart';

class LightingDeviceEntity extends Device with EquatableMixin {
  final bool isOn;

  const LightingDeviceEntity({required super.id, required this.isOn});

  @override
  List<Object?> get props => [id, isOn];
}
