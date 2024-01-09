abstract class IRemoteRepositoryAuth {
  Future<void> registerNewUser({
    required String username,
    required String email,
    required String password,
    required bool isVerified,
    required bool isSuperUser,
  });

  Future<(String, String)> authorize({
    required String username,
    required String password,
  });

  Future<(String, String)> refresh();
}
