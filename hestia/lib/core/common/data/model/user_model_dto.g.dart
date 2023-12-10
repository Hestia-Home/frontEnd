// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) => UserModelDto(
      isLoggedIn: json['is_logged_in'] as bool,
      name: json['name'] as String,
      homes: (json['homes'] as List<dynamic>)
          .map((e) => HomeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isNew: json['is_new'] as bool?,
      age: json['age'] as int?,
      sex: json['sex'] as String?,
    );

Map<String, dynamic> _$UserModelDtoToJson(UserModelDto instance) =>
    <String, dynamic>{
      'is_logged_in': instance.isLoggedIn,
      'name': instance.name,
      'is_new': instance.isNew,
      'age': instance.age,
      'sex': instance.sex,
      'homes': instance.homes,
    };
