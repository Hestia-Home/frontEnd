import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hestia/core/common/util/json.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createFactory: true,
)
class AuthResponseDto {
  final String accessToken;
  final String refreshToken;

  const AuthResponseDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponseDto.fromJson(Json json) =>
      _$AuthResponseDtoFromJson(json);
}

FutureOr<AuthResponseDto> deserializeAuthResponseDto(Json json) =>
    AuthResponseDto.fromJson(json);
