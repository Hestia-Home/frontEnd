abstract class ILocalRepositoryAuth {
  Future<void> saveAccessToken(String accessToken);
  Future<void> saveRefreshToken(String refreshToken);

  Future<String> getAccessToken();
  Future<String> getRefreshToken();
  Future<bool> authenticate();
}
