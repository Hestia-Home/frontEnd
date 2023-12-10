import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hestia/core/common/domain/entity/substates/settings_state.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:redux/redux.dart';

part 'state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required UserState userState,
    required SettingsState settingsState,
  }) = _AppState;
}

class AppStore extends Store<AppState> {
  AppStore(
    super.reducer, {
    required super.initialState,
  });
}
