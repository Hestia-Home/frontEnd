import 'package:flutter/material.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:hestia/core/redux/reducers/reducer.dart';
import 'package:hestia/core/redux/state/state.dart';
import 'package:hestia/feature/main/domain/repository/i_local_repository.dart';

class ServicesStarter {
  final ILocalRepository localRepository;
  ServicesStarter({
    required this.localRepository,
  });
  late final AppStore store;

  Future<void> init() async {
    final settingsState = await localRepository.getSettingsState();
    final userState = await localRepository.getUserState();
    store = AppStore(
      AppReducer.stateReducer,
      initialState: AppState(
        userState: userState ??
            const UserState(
              isLoggedIn: false,
              name: '',
              homes: [],
            ),
        settingsState: settingsState,
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
      () => WidgetsBinding.instance.allowFirstFrame(),
    );
  }
}
