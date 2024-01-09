abstract class IRemoteDataSourceAuth {
  Future<void> registerNewUser({
    required String username,
    required String password,
    required String email,
    required bool isVerified,
    required bool isSuperUser,
  });
  Future<(String, String)> authenticate(String username, String password);

  Future<(String, String)> refresh();
}
