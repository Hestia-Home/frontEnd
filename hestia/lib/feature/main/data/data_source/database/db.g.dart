// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roomNameMeta =
      const VerificationMeta('roomName');
  @override
  late final GeneratedColumn<String> roomName = GeneratedColumn<String>(
      'room_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [roomName, id];
  @override
  String get aliasedName => _alias ?? 'rooms';
  @override
  String get actualTableName => 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('room_name')) {
      context.handle(_roomNameMeta,
          roomName.isAcceptableOrUnknown(data['room_name']!, _roomNameMeta));
    } else if (isInserting) {
      context.missing(_roomNameMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      roomName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_name'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  final String roomName;
  final int id;
  const Room({required this.roomName, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['room_name'] = Variable<String>(roomName);
    map['id'] = Variable<int>(id);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      roomName: Value(roomName),
      id: Value(id),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      roomName: serializer.fromJson<String>(json['roomName']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'roomName': serializer.toJson<String>(roomName),
      'id': serializer.toJson<int>(id),
    };
  }

  Room copyWith({String? roomName, int? id}) => Room(
        roomName: roomName ?? this.roomName,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('roomName: $roomName, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roomName, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room && other.roomName == this.roomName && other.id == this.id);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<String> roomName;
  final Value<int> id;
  const RoomsCompanion({
    this.roomName = const Value.absent(),
    this.id = const Value.absent(),
  });
  RoomsCompanion.insert({
    required String roomName,
    this.id = const Value.absent(),
  }) : roomName = Value(roomName);
  static Insertable<Room> custom({
    Expression<String>? roomName,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (roomName != null) 'room_name': roomName,
      if (id != null) 'id': id,
    });
  }

  RoomsCompanion copyWith({Value<String>? roomName, Value<int>? id}) {
    return RoomsCompanion(
      roomName: roomName ?? this.roomName,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roomName.present) {
      map['room_name'] = Variable<String>(roomName.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('roomName: $roomName, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $SmartDevicesTable extends SmartDevices
    with TableInfo<$SmartDevicesTable, Devices> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmartDevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deviceTypeMeta =
      const VerificationMeta('deviceType');
  @override
  late final GeneratedColumn<int> deviceType = GeneratedColumn<int>(
      'device_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES rooms (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, deviceType, data, roomId];
  @override
  String get aliasedName => _alias ?? 'smart_devices';
  @override
  String get actualTableName => 'smart_devices';
  @override
  VerificationContext validateIntegrity(Insertable<Devices> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_type')) {
      context.handle(
          _deviceTypeMeta,
          deviceType.isAcceptableOrUnknown(
              data['device_type']!, _deviceTypeMeta));
    } else if (isInserting) {
      context.missing(_deviceTypeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Devices map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Devices(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deviceType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}device_type'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
    );
  }

  @override
  $SmartDevicesTable createAlias(String alias) {
    return $SmartDevicesTable(attachedDatabase, alias);
  }
}

class Devices extends DataClass implements Insertable<Devices> {
  final int id;
  final int deviceType;
  final String data;
  final int roomId;
  const Devices(
      {required this.id,
      required this.deviceType,
      required this.data,
      required this.roomId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_type'] = Variable<int>(deviceType);
    map['data'] = Variable<String>(data);
    map['room_id'] = Variable<int>(roomId);
    return map;
  }

  SmartDevicesCompanion toCompanion(bool nullToAbsent) {
    return SmartDevicesCompanion(
      id: Value(id),
      deviceType: Value(deviceType),
      data: Value(data),
      roomId: Value(roomId),
    );
  }

  factory Devices.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Devices(
      id: serializer.fromJson<int>(json['id']),
      deviceType: serializer.fromJson<int>(json['deviceType']),
      data: serializer.fromJson<String>(json['data']),
      roomId: serializer.fromJson<int>(json['roomId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceType': serializer.toJson<int>(deviceType),
      'data': serializer.toJson<String>(data),
      'roomId': serializer.toJson<int>(roomId),
    };
  }

  Devices copyWith({int? id, int? deviceType, String? data, int? roomId}) =>
      Devices(
        id: id ?? this.id,
        deviceType: deviceType ?? this.deviceType,
        data: data ?? this.data,
        roomId: roomId ?? this.roomId,
      );
  @override
  String toString() {
    return (StringBuffer('Devices(')
          ..write('id: $id, ')
          ..write('deviceType: $deviceType, ')
          ..write('data: $data, ')
          ..write('roomId: $roomId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deviceType, data, roomId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Devices &&
          other.id == this.id &&
          other.deviceType == this.deviceType &&
          other.data == this.data &&
          other.roomId == this.roomId);
}

class SmartDevicesCompanion extends UpdateCompanion<Devices> {
  final Value<int> id;
  final Value<int> deviceType;
  final Value<String> data;
  final Value<int> roomId;
  const SmartDevicesCompanion({
    this.id = const Value.absent(),
    this.deviceType = const Value.absent(),
    this.data = const Value.absent(),
    this.roomId = const Value.absent(),
  });
  SmartDevicesCompanion.insert({
    this.id = const Value.absent(),
    required int deviceType,
    required String data,
    required int roomId,
  })  : deviceType = Value(deviceType),
        data = Value(data),
        roomId = Value(roomId);
  static Insertable<Devices> custom({
    Expression<int>? id,
    Expression<int>? deviceType,
    Expression<String>? data,
    Expression<int>? roomId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceType != null) 'device_type': deviceType,
      if (data != null) 'data': data,
      if (roomId != null) 'room_id': roomId,
    });
  }

  SmartDevicesCompanion copyWith(
      {Value<int>? id,
      Value<int>? deviceType,
      Value<String>? data,
      Value<int>? roomId}) {
    return SmartDevicesCompanion(
      id: id ?? this.id,
      deviceType: deviceType ?? this.deviceType,
      data: data ?? this.data,
      roomId: roomId ?? this.roomId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceType.present) {
      map['device_type'] = Variable<int>(deviceType.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmartDevicesCompanion(')
          ..write('id: $id, ')
          ..write('deviceType: $deviceType, ')
          ..write('data: $data, ')
          ..write('roomId: $roomId')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _biometricsAuthRequiredMeta =
      const VerificationMeta('biometricsAuthRequired');
  @override
  late final GeneratedColumn<bool> biometricsAuthRequired =
      GeneratedColumn<bool>('biometrics_auth_required', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("biometrics_auth_required" IN (0, 1))'));
  static const VerificationMeta _pinAuthRequiredMeta =
      const VerificationMeta('pinAuthRequired');
  @override
  late final GeneratedColumn<bool> pinAuthRequired = GeneratedColumn<bool>(
      'pin_auth_required', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("pin_auth_required" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, biometricsAuthRequired, pinAuthRequired];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('biometrics_auth_required')) {
      context.handle(
          _biometricsAuthRequiredMeta,
          biometricsAuthRequired.isAcceptableOrUnknown(
              data['biometrics_auth_required']!, _biometricsAuthRequiredMeta));
    }
    if (data.containsKey('pin_auth_required')) {
      context.handle(
          _pinAuthRequiredMeta,
          pinAuthRequired.isAcceptableOrUnknown(
              data['pin_auth_required']!, _pinAuthRequiredMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      biometricsAuthRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}biometrics_auth_required']),
      pinAuthRequired: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}pin_auth_required']),
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final bool? biometricsAuthRequired;
  final bool? pinAuthRequired;
  const Setting(
      {required this.id, this.biometricsAuthRequired, this.pinAuthRequired});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || biometricsAuthRequired != null) {
      map['biometrics_auth_required'] = Variable<bool>(biometricsAuthRequired);
    }
    if (!nullToAbsent || pinAuthRequired != null) {
      map['pin_auth_required'] = Variable<bool>(pinAuthRequired);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      biometricsAuthRequired: biometricsAuthRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(biometricsAuthRequired),
      pinAuthRequired: pinAuthRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(pinAuthRequired),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      biometricsAuthRequired:
          serializer.fromJson<bool?>(json['biometricsAuthRequired']),
      pinAuthRequired: serializer.fromJson<bool?>(json['pinAuthRequired']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'biometricsAuthRequired':
          serializer.toJson<bool?>(biometricsAuthRequired),
      'pinAuthRequired': serializer.toJson<bool?>(pinAuthRequired),
    };
  }

  Setting copyWith(
          {int? id,
          Value<bool?> biometricsAuthRequired = const Value.absent(),
          Value<bool?> pinAuthRequired = const Value.absent()}) =>
      Setting(
        id: id ?? this.id,
        biometricsAuthRequired: biometricsAuthRequired.present
            ? biometricsAuthRequired.value
            : this.biometricsAuthRequired,
        pinAuthRequired: pinAuthRequired.present
            ? pinAuthRequired.value
            : this.pinAuthRequired,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('biometricsAuthRequired: $biometricsAuthRequired, ')
          ..write('pinAuthRequired: $pinAuthRequired')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, biometricsAuthRequired, pinAuthRequired);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.biometricsAuthRequired == this.biometricsAuthRequired &&
          other.pinAuthRequired == this.pinAuthRequired);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<bool?> biometricsAuthRequired;
  final Value<bool?> pinAuthRequired;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.biometricsAuthRequired = const Value.absent(),
    this.pinAuthRequired = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.biometricsAuthRequired = const Value.absent(),
    this.pinAuthRequired = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<bool>? biometricsAuthRequired,
    Expression<bool>? pinAuthRequired,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (biometricsAuthRequired != null)
        'biometrics_auth_required': biometricsAuthRequired,
      if (pinAuthRequired != null) 'pin_auth_required': pinAuthRequired,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<bool?>? biometricsAuthRequired,
      Value<bool?>? pinAuthRequired}) {
    return SettingsCompanion(
      id: id ?? this.id,
      biometricsAuthRequired:
          biometricsAuthRequired ?? this.biometricsAuthRequired,
      pinAuthRequired: pinAuthRequired ?? this.pinAuthRequired,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (biometricsAuthRequired.present) {
      map['biometrics_auth_required'] =
          Variable<bool>(biometricsAuthRequired.value);
    }
    if (pinAuthRequired.present) {
      map['pin_auth_required'] = Variable<bool>(pinAuthRequired.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('biometricsAuthRequired: $biometricsAuthRequired, ')
          ..write('pinAuthRequired: $pinAuthRequired')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isLoggedInMeta =
      const VerificationMeta('isLoggedIn');
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
      'is_logged_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_logged_in" IN (0, 1))'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isNewMeta = const VerificationMeta('isNew');
  @override
  late final GeneratedColumn<bool> isNew = GeneratedColumn<bool>(
      'is_new', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_new" IN (0, 1))'));
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, isLoggedIn, name, isNew, age, sex];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
          _isLoggedInMeta,
          isLoggedIn.isAcceptableOrUnknown(
              data['is_logged_in']!, _isLoggedInMeta));
    } else if (isInserting) {
      context.missing(_isLoggedInMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_new')) {
      context.handle(
          _isNewMeta, isNew.isAcceptableOrUnknown(data['is_new']!, _isNewMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isLoggedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_logged_in'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isNew: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_new']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex']),
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final bool isLoggedIn;
  final String name;
  final bool? isNew;
  final int? age;
  final String? sex;
  const UserData(
      {required this.id,
      required this.isLoggedIn,
      required this.name,
      this.isNew,
      this.age,
      this.sex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || isNew != null) {
      map['is_new'] = Variable<bool>(isNew);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      isLoggedIn: Value(isLoggedIn),
      name: Value(name),
      isNew:
          isNew == null && nullToAbsent ? const Value.absent() : Value(isNew),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
      name: serializer.fromJson<String>(json['name']),
      isNew: serializer.fromJson<bool?>(json['isNew']),
      age: serializer.fromJson<int?>(json['age']),
      sex: serializer.fromJson<String?>(json['sex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
      'name': serializer.toJson<String>(name),
      'isNew': serializer.toJson<bool?>(isNew),
      'age': serializer.toJson<int?>(age),
      'sex': serializer.toJson<String?>(sex),
    };
  }

  UserData copyWith(
          {int? id,
          bool? isLoggedIn,
          String? name,
          Value<bool?> isNew = const Value.absent(),
          Value<int?> age = const Value.absent(),
          Value<String?> sex = const Value.absent()}) =>
      UserData(
        id: id ?? this.id,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        name: name ?? this.name,
        isNew: isNew.present ? isNew.value : this.isNew,
        age: age.present ? age.value : this.age,
        sex: sex.present ? sex.value : this.sex,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('name: $name, ')
          ..write('isNew: $isNew, ')
          ..write('age: $age, ')
          ..write('sex: $sex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isLoggedIn, name, isNew, age, sex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.isLoggedIn == this.isLoggedIn &&
          other.name == this.name &&
          other.isNew == this.isNew &&
          other.age == this.age &&
          other.sex == this.sex);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<bool> isLoggedIn;
  final Value<String> name;
  final Value<bool?> isNew;
  final Value<int?> age;
  final Value<String?> sex;
  const UserCompanion({
    this.id = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
    this.name = const Value.absent(),
    this.isNew = const Value.absent(),
    this.age = const Value.absent(),
    this.sex = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required bool isLoggedIn,
    required String name,
    this.isNew = const Value.absent(),
    this.age = const Value.absent(),
    this.sex = const Value.absent(),
  })  : isLoggedIn = Value(isLoggedIn),
        name = Value(name);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<bool>? isLoggedIn,
    Expression<String>? name,
    Expression<bool>? isNew,
    Expression<int>? age,
    Expression<String>? sex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (name != null) 'name': name,
      if (isNew != null) 'is_new': isNew,
      if (age != null) 'age': age,
      if (sex != null) 'sex': sex,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isLoggedIn,
      Value<String>? name,
      Value<bool?>? isNew,
      Value<int?>? age,
      Value<String?>? sex}) {
    return UserCompanion(
      id: id ?? this.id,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      name: name ?? this.name,
      isNew: isNew ?? this.isNew,
      age: age ?? this.age,
      sex: sex ?? this.sex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isNew.present) {
      map['is_new'] = Variable<bool>(isNew.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('name: $name, ')
          ..write('isNew: $isNew, ')
          ..write('age: $age, ')
          ..write('sex: $sex')
          ..write(')'))
        .toString();
  }
}

class $HomesDataTable extends HomesData
    with TableInfo<$HomesDataTable, HomeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HomesDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
      'home_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isConfirmedMeta =
      const VerificationMeta('isConfirmed');
  @override
  late final GeneratedColumn<bool> isConfirmed = GeneratedColumn<bool>(
      'is_confirmed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_confirmed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, homeId, isConfirmed];
  @override
  String get aliasedName => _alias ?? 'homes_data';
  @override
  String get actualTableName => 'homes_data';
  @override
  VerificationContext validateIntegrity(Insertable<HomeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('home_id')) {
      context.handle(_homeIdMeta,
          homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta));
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('is_confirmed')) {
      context.handle(
          _isConfirmedMeta,
          isConfirmed.isAcceptableOrUnknown(
              data['is_confirmed']!, _isConfirmedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HomeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HomeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      homeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}home_id'])!,
      isConfirmed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_confirmed']),
    );
  }

  @override
  $HomesDataTable createAlias(String alias) {
    return $HomesDataTable(attachedDatabase, alias);
  }
}

class HomeData extends DataClass implements Insertable<HomeData> {
  final int id;
  final String homeId;
  final bool? isConfirmed;
  const HomeData({required this.id, required this.homeId, this.isConfirmed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['home_id'] = Variable<String>(homeId);
    if (!nullToAbsent || isConfirmed != null) {
      map['is_confirmed'] = Variable<bool>(isConfirmed);
    }
    return map;
  }

  HomesDataCompanion toCompanion(bool nullToAbsent) {
    return HomesDataCompanion(
      id: Value(id),
      homeId: Value(homeId),
      isConfirmed: isConfirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(isConfirmed),
    );
  }

  factory HomeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HomeData(
      id: serializer.fromJson<int>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      isConfirmed: serializer.fromJson<bool?>(json['isConfirmed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'homeId': serializer.toJson<String>(homeId),
      'isConfirmed': serializer.toJson<bool?>(isConfirmed),
    };
  }

  HomeData copyWith(
          {int? id,
          String? homeId,
          Value<bool?> isConfirmed = const Value.absent()}) =>
      HomeData(
        id: id ?? this.id,
        homeId: homeId ?? this.homeId,
        isConfirmed: isConfirmed.present ? isConfirmed.value : this.isConfirmed,
      );
  @override
  String toString() {
    return (StringBuffer('HomeData(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('isConfirmed: $isConfirmed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, homeId, isConfirmed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeData &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.isConfirmed == this.isConfirmed);
}

class HomesDataCompanion extends UpdateCompanion<HomeData> {
  final Value<int> id;
  final Value<String> homeId;
  final Value<bool?> isConfirmed;
  const HomesDataCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.isConfirmed = const Value.absent(),
  });
  HomesDataCompanion.insert({
    this.id = const Value.absent(),
    required String homeId,
    this.isConfirmed = const Value.absent(),
  }) : homeId = Value(homeId);
  static Insertable<HomeData> custom({
    Expression<int>? id,
    Expression<String>? homeId,
    Expression<bool>? isConfirmed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (isConfirmed != null) 'is_confirmed': isConfirmed,
    });
  }

  HomesDataCompanion copyWith(
      {Value<int>? id, Value<String>? homeId, Value<bool?>? isConfirmed}) {
    return HomesDataCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (isConfirmed.present) {
      map['is_confirmed'] = Variable<bool>(isConfirmed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HomesDataCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('isConfirmed: $isConfirmed')
          ..write(')'))
        .toString();
  }
}

abstract class _$HestiaDB extends GeneratedDatabase {
  _$HestiaDB(QueryExecutor e) : super(e);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $SmartDevicesTable smartDevices = $SmartDevicesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $UserTable user = $UserTable(this);
  late final $HomesDataTable homesData = $HomesDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [rooms, smartDevices, settings, user, homesData];
}
