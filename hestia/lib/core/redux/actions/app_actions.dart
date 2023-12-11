import 'package:equatable/equatable.dart';
import 'package:hestia/core/common/domain/entity/substates/settings_state.dart';
import 'package:hestia/core/common/domain/entity/substates/user_state.dart';

abstract base class Action<T> with EquatableMixin {
  const Action(this.payload);
  final T payload;
}

final class UpdateSettingsAction extends Action<SettingsState> {
  const UpdateSettingsAction(super.payload);

  @override
  List<Object?> get props => [payload];
}

final class UpdateUserAction extends Action<UserState> {
  const UpdateUserAction(super.payload);

  @override
  List<Object?> get props => [payload];
}
