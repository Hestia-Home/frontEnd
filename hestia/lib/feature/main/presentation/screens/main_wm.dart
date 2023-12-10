import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:hestia/core/di/service_locator.dart';
import 'package:hestia/feature/main/data/data_source/database/db.dart';
import 'package:hestia/feature/main/domain/entity/device.dart';
import 'package:hestia/feature/main/domain/entity/room_entity.dart';
import 'package:hestia/feature/main/presentation/screens/main_model.dart';
import 'package:hestia/feature/main/presentation/screens/main_widget.dart';
import 'package:provider/provider.dart';

abstract class IMainWidgetModel implements IWidgetModel {
  EntityStateNotifier<List<Device>> get devicesState;
  EntityStateNotifier<RoomEntity> get roomState;
  EntityStateNotifier<DateTime> get dateTimeState;
  EntityStateNotifier<UserState> get userState;
  EntityStateNotifier<List<Room>> get roomsState;

  ImageProvider getUserAvatar();

  Size get size;
}

class MainWidgetModel extends WidgetModel<MainWidget, MainModel>
    implements IMainWidgetModel {
  MainWidgetModel(super.model);

  DateTime get _current => DateTime.now();

  @override
  Size get size => MediaQuery.of(context).size;

  @override
  void initWidgetModel() {
    _checkIfDateTimeChanged();
    super.initWidgetModel();
  }

  void _checkIfDateTimeChanged() {
    DateTime currentDay = DateTime.now();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // check if day is changed
      if (_current.day > currentDay.day ||
          _current.day == 0 && currentDay.day > _current.day) {
        _dateTimeState.loading(currentDay);
        _dateTimeState.content(_current);
        currentDay = _current;
      }
    });
  }

  @override
  void dispose() {
    _dateTimeState.dispose();
    super.dispose();
  }

  @override
  // TODO: implement devicesState
  EntityStateNotifier<List<Device>> get devicesState =>
      throw UnimplementedError();

  @override
  // TODO: implement roomState
  EntityStateNotifier<RoomEntity> get roomState => throw UnimplementedError();

  @override
  EntityStateNotifier<DateTime> get dateTimeState => _dateTimeState;

  final EntityStateNotifier<DateTime> _dateTimeState =
      EntityStateNotifier.value(DateTime.now());

  @override
  // TODO: implement userState
  EntityStateNotifier<UserState> get userState => throw UnimplementedError();

  @override
  ImageProvider<Object> getUserAvatar() {
    // TODO: implement getUserAvatar
    throw UnimplementedError();
  }

  @override
  // TODO: implement rooomsState
  EntityStateNotifier<List<Room>> get roomsState => throw UnimplementedError();
}

MainWidgetModel createMainWM(BuildContext context) {
  final sl = context.read<ServiceLocator>();
  return MainWidgetModel(
    MainModel(
      locaRepository: sl.localRepositoryMain,
      remoteRepository: sl.remoteRepository,
    ),
  );
}
