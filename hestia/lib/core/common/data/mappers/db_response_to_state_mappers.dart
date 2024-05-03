import 'package:hestia/core/common/domain/entity/home.dart';
import 'package:hestia/core/common/domain/entity/substates/settings_state.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';
import 'package:hestia/feature/main/data/data_source/database/db.dart';

UserState mapUserDataToUserState(UserData userData, List<HomeData> homes) {
  return UserState(
    isLoggedIn: userData.isLoggedIn,
    name: userData.name,
    homes: homes.map(_mapHomeDataToHome).toList(),
    isNew: userData.isNew,
    sex: userData.sex,
    age: userData.age,
  );
}

Home _mapHomeDataToHome(HomeData homeData) {
  return Home(
    homeId: homeData.homeId,
    isConfirmed: homeData.isConfirmed,
  );
}

SettingsState mapSettingToState(Setting settings) {
  return SettingsState(
    settings.biometricsAuthRequired,
    settings.pinAuthRequired,
  );
}
