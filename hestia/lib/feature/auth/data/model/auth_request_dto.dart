import 'dart:async';

import 'package:hestia/core/common/utils/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_request_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createFactory: false,
  createToJson: true,
)
class AuthRequestDto {
  final String username;
  final String password;

  const AuthRequestDto({
    required this.password,
    required this.username,
  });

  Json toJson() => _$AuthRequestDtoToJson(this);
}

FutureOr<Json> serializeAuthRequestDto(AuthRequestDto dto) => dto.toJson();
