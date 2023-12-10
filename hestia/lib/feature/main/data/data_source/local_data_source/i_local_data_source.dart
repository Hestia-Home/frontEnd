import 'package:flutter/material.dart';
import 'package:hestia/feature/main/domain/entity/device.dart';
import 'package:hestia/feature/main/domain/entity/room_entity.dart';

abstract class ILocalDataSource {
  Future<ImageProvider?> getUserAvatarImage();
  Stream<List<Device>> devicesFromDBStream();
  Future<void> createOrUpdateDeviceInfo(Map<String, dynamic> json);
  Future<void> createOrUpdateRoomInfo(Map<String, dynamic> json);
  Future<void> saveUserAvatarImage();
  Stream<List<RoomEntity>> watchRoomList();
  void setRoomList(List<String> roomList);
}
