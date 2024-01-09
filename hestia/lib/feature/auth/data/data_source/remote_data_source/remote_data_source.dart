import 'package:hestia/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:hestia/feature/auth/data/model/auth_request_dto.dart';
import 'package:hestia/feature/auth/data/model/register_user_request_dto.dart';
import 'package:hestia/feature/auth/data/services/auth_service.dart';
import 'package:hestia/feature/auth/domain/repository/i_local_repository.dart';

class RemoteDataSourceAuth implements IRemoteDataSourceAuth {
  final AuthService _service;
  final ILocalRepositoryAuth _localRepository;

  const RemoteDataSourceAuth(
      {required AuthService service,
      required ILocalRepositoryAuth localRepository})
      : _localRepository = localRepository,
        _service = service;

  @override
  Future<void> registerNewUser({
    required String username,
    required String password,
    required String email,
    required bool isVerified,
    required bool isSuperUser,
  }) async =>
      await _service.registerUser(
        request: RegisterUserRequestDto(
          email: email,
          username: username,
          isSuperUser: isSuperUser,
          isVerified: isVerified,
          password: password,
        ),
      );

  @override
  Future<(String, String)> authenticate(
      String username, String password) async {
    final response = await _service.login(
      request: AuthRequestDto(
        password: password,
        username: username,
      ),
    );

    await _localRepository.saveAccessToken(response.accessToken);
    await _localRepository.saveRefreshToken(response.refreshToken);

    return (response.accessToken, response.refreshToken);
  }

  @override
  Future<(String, String)> refresh() async {
    final response = await _service.refresh();

    await _localRepository.saveAccessToken(response.accessToken);
    await _localRepository.saveRefreshToken(response.refreshToken);

    return (response.accessToken, response.refreshToken);
  }
}
