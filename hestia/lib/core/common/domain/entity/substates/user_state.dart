import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hestia/core/common/domain/entity/home.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required bool isLoggedIn,
    required String name,
    bool? isNew,
    int? age,
    String? sex,
    required List<Home> homes,
  }) = _UserState;
}
