import 'package:hestia/core/redux/actions/app_actions.dart';
import 'package:hestia/core/redux/state/state.dart';

class AppReducer {
  static AppState stateReducer(AppState state, dynamic action) {
    if (action is UpdateSettingsAction) {
      return state.copyWith(
        settingsState: state.settingsState.copyWith(
          biometricsAuthRequired: action.payload.biometricsAuthRequired,
          pinAuthRequired: action.payload.pinAuthRequired,
        ),
      );
    }
    if (action is UpdateUserAction) {
      final payload = action.payload;
      return state.copyWith(
        userState: state.userState.copyWith(
          age: payload.age,
          sex: payload.sex,
          isLoggedIn: payload.isLoggedIn,
          isNew: payload.isNew,
          name: payload.name,
          homes: payload.homes,
        ),
      );
    }
    return state;
  }
}
