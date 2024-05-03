import 'package:hestia/feature/auth/data/model/register_user_request_dto.dart';

abstract class IRemoteDataSourceAuth {
  Future<void> registerNewUser({required RegisterUserRequestDto requestDto});
  Future<(String, String)> authenticate(String username, String password);

  Future<(String, String)> refresh();
}
