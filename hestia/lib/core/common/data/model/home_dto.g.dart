// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) => HomeDto(
      homeId: json['home_id'] as String,
      isConfirmed: json['is_confirmed'] as bool?,
    );

Map<String, dynamic> _$HomeDtoToJson(HomeDto instance) => <String, dynamic>{
      'home_id': instance.homeId,
      'is_confirmed': instance.isConfirmed,
    };
