import 'dart:async';

import 'package:hestia/core/common/util/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_user_request_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createFactory: false,
  createToJson: true,
)
class RegisterUserRequestDto {
  final String username;
  final String password;
  final String email;
  final bool isVerified;
  final bool? isSuperUser;
  final bool? isActive;

  const RegisterUserRequestDto({
    required this.email,
    required this.username,
    required this.isSuperUser,
    required this.isVerified,
    required this.password,
    this.isActive,
  });

  Json toJson() => _$RegisterUserRequestDtoToJson(this);
}

FutureOr<Json> serializeRegisterUserRequestDto(RegisterUserRequestDto dto) =>
    dto.toJson();
