import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hestia/core/common/utils/urls.dart';
import 'package:hestia/feature/auth/data/model/auth_request_dto.dart';
import 'package:hestia/feature/auth/data/model/auth_response_dto.dart';
import 'package:hestia/feature/auth/data/model/register_user_request_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(Urls.register)
  Future<void> registerUser({@Body() required RegisterUserRequestDto request});

  @POST(Urls.login)
  Future<AuthResponseDto> login({@Body() required AuthRequestDto request});

  @POST(Urls.refresh)
  Future<AuthResponseDto> refresh();
}
