import 'package:flutter/material.dart';
import 'package:hestia/core/common/data/mappers/db_response_to_state_mappers.dart';
import 'package:hestia/core/common/domain/entity/substates/settings_state.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:hestia/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:hestia/feature/main/domain/entity/device.dart';
import 'package:hestia/feature/main/domain/entity/room_entity.dart';
import 'package:hestia/feature/main/domain/repository/i_local_repository.dart';

class LocalRepository implements ILocalRepository {
  final ILocalDataSource _localDataSource;

  const LocalRepository(this._localDataSource);

  @override
  Future<void> saveUserAvatarImage() async =>
      await _localDataSource.saveUserAvatarImage();

  @override
  Future<ImageProvider?> getUserAvatarImage() async =>
      _localDataSource.getUserAvatarImage();

  @override
  Stream<List<RoomEntity>> watchRoomList() => _localDataSource.watchRoomList();

  @override
  void setRoomList(List<String> roomList) =>
      _localDataSource.setRoomList(roomList);

  @override
  Stream<List<Device>> devicesFromDBStream() =>
      _localDataSource.devicesFromDBStream();

  @override
  Future<SettingsState> getSettingsState() async {
    final settings = await _localDataSource.getSettings();
    if (settings == null) {
      return const SettingsState(false, false);
    }
    return mapSettingToState(settings);
  }

  @override
  Future<UserState?> getUserState() async {
    final userData = await _localDataSource.getUser();
    if (userData == null) {
      return null;
    }

    final homes = await _localDataSource.getHomes();

    return mapUserDataToUserState(userData, homes);
  }
}
