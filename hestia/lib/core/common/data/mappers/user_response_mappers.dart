import 'package:hestia/core/common/data/model/home_dto.dart';
import 'package:hestia/core/common/data/model/user_model_dto.dart';
import 'package:hestia/core/common/domain/entity/home.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';

UserState mapUserModelDtoToState(UserModelDto dto) {
  return UserState(
      isLoggedIn: dto.isLoggedIn,
      name: dto.name,
      age: dto.age,
      sex: dto.sex,
      isNew: dto.isNew,
      homes: dto.homes.map(_mapHomeDto).toList());
}

Home _mapHomeDto(HomeDto dto) {
  return Home(
    homeId: dto.homeId,
    isConfirmed: dto.isConfirmed,
  );
}
