import 'package:equatable/equatable.dart';
import 'package:hestia/core/common/domain/entity/substates/settings_state.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';

abstract base class Action<T> with EquatableMixin {
  const Action(this.payload);
  final T payload;
}

final class UpdateSettingsState extends Action<SettingsState> {
  const UpdateSettingsState(super.payload);

  @override
  List<Object?> get props => [payload];
}

final class UpdateUserState extends Action<UserState> {
  const UpdateUserState(super.payload);

  @override
  List<Object?> get props => [payload];
}
