import 'package:flutter/material.dart';
import 'package:hestia/core/common/domain/entity/substates/settings_state.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:hestia/feature/main/domain/entity/device.dart';
import 'package:hestia/feature/main/domain/entity/room_entity.dart';

abstract class ILocalRepository {
  Future<ImageProvider?> getUserAvatarImage();
  Stream<List<Device>> devicesFromDBStream();
  Future<void> saveUserAvatarImage();
  Stream<List<RoomEntity>> watchRoomList();
  Future<UserState?> getUserState();
  Future<SettingsState> getSettingsState();

  void setRoomList(List<String> roomList);
}
