// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool? get isNew => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get sex => throw _privateConstructorUsedError;
  List<Home> get homes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {bool isLoggedIn,
      String name,
      bool? isNew,
      int? age,
      String? sex,
      List<Home> homes});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? name = null,
    Object? isNew = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? homes = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      homes: null == homes
          ? _value.homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<Home>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoggedIn,
      String name,
      bool? isNew,
      int? age,
      String? sex,
      List<Home> homes});
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserState>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? name = null,
    Object? isNew = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? homes = null,
  }) {
    return _then(_$_UserState(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      homes: null == homes
          ? _value._homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<Home>,
    ));
  }
}

/// @nodoc

class _$_UserState implements _UserState {
  const _$_UserState(
      {required this.isLoggedIn,
      required this.name,
      this.isNew,
      this.age,
      this.sex,
      required final List<Home> homes})
      : _homes = homes;

  @override
  final bool isLoggedIn;
  @override
  final String name;
  @override
  final bool? isNew;
  @override
  final int? age;
  @override
  final String? sex;
  final List<Home> _homes;
  @override
  List<Home> get homes {
    if (_homes is EqualUnmodifiableListView) return _homes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homes);
  }

  @override
  String toString() {
    return 'UserState(isLoggedIn: $isLoggedIn, name: $name, isNew: $isNew, age: $age, sex: $sex, homes: $homes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            const DeepCollectionEquality().equals(other._homes, _homes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn, name, isNew, age,
      sex, const DeepCollectionEquality().hash(_homes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {required final bool isLoggedIn,
      required final String name,
      final bool? isNew,
      final int? age,
      final String? sex,
      required final List<Home> homes}) = _$_UserState;

  @override
  bool get isLoggedIn;
  @override
  String get name;
  @override
  bool? get isNew;
  @override
  int? get age;
  @override
  String? get sex;
  @override
  List<Home> get homes;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
