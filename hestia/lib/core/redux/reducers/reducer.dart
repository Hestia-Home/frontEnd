import 'package:hestia/core/redux/actions/app_actions.dart';
import 'package:hestia/core/redux/state/state.dart';

class AppReducer {
  static AppState stateReducer(AppState state, dynamic action) {
    if (action is UpdateSettingsState) {
      return state.copyWith(settingsState: action.payload);
    }
    if (action is UpdateUserState) {}
    return state.copyWith(userState: action.payload);
  }
}
