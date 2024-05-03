import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hestia/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LocalDataSourceAuth implements ILocalDataSourceAuth {
  final FlutterSecureStorage secureStorage;
  final LocalAuthentication authentication;

  const LocalDataSourceAuth({
    required this.authentication,
    required this.secureStorage,
  });

  @override
  Future<bool> authenticate() async {
    bool didAuthenticate = false;
    final bool canAuthenticateWithBiometrics =
        await authentication.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics ||
        await authentication.isDeviceSupported();
    if (canAuthenticate) {
      try {
        didAuthenticate = await authentication.authenticate(
          localizedReason: 'Авторизуйтесь, чтобы продолжить',
          authMessages: <AuthMessages>[
            const AndroidAuthMessages(
                signInTitle: "Необходима аутентификация!",
                biometricHint: "",
                cancelButton: "Нет, спасибо!")
          ],
          options: const AuthenticationOptions(
            stickyAuth: false,
            useErrorDialogs: true,
          ),
        );
      } catch (e) {
        Exception(e.toString());
      }
    }
    return didAuthenticate;
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await secureStorage.write(
      key: 'access_token',
      value: accessToken,
    );
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await secureStorage.write(
      key: 'refresh_token',
      value: refreshToken,
    );
  }

  @override
  Future<String> getAccessToken() async {
    final authToken = await secureStorage.read(key: 'access_token') ?? '';
    return authToken;
  }

  @override
  Future<String> getRefreshToken() async {
    final authToken = await secureStorage.read(key: 'refresh_token') ?? '';
    return authToken;
  }
}
