// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthViewState {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  AuthPageStatus get status => throw _privateConstructorUsedError;
  AuthPageScreen get activeScreen => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get showConfirmPassword => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthViewStateCopyWith<AuthViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewStateCopyWith<$Res> {
  factory $AuthViewStateCopyWith(
          AuthViewState value, $Res Function(AuthViewState) then) =
      _$AuthViewStateCopyWithImpl<$Res, AuthViewState>;
  @useResult
  $Res call(
      {String username,
      String password,
      String confirmPassword,
      AuthPageStatus status,
      AuthPageScreen activeScreen,
      bool showPassword,
      bool showConfirmPassword,
      String? errorMessage});
}

/// @nodoc
class _$AuthViewStateCopyWithImpl<$Res, $Val extends AuthViewState>
    implements $AuthViewStateCopyWith<$Res> {
  _$AuthViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? status = null,
    Object? activeScreen = null,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthPageStatus,
      activeScreen: null == activeScreen
          ? _value.activeScreen
          : activeScreen // ignore: cast_nullable_to_non_nullable
              as AuthPageScreen,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthViewStateImplCopyWith<$Res>
    implements $AuthViewStateCopyWith<$Res> {
  factory _$$AuthViewStateImplCopyWith(
          _$AuthViewStateImpl value, $Res Function(_$AuthViewStateImpl) then) =
      __$$AuthViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      String confirmPassword,
      AuthPageStatus status,
      AuthPageScreen activeScreen,
      bool showPassword,
      bool showConfirmPassword,
      String? errorMessage});
}

/// @nodoc
class __$$AuthViewStateImplCopyWithImpl<$Res>
    extends _$AuthViewStateCopyWithImpl<$Res, _$AuthViewStateImpl>
    implements _$$AuthViewStateImplCopyWith<$Res> {
  __$$AuthViewStateImplCopyWithImpl(
      _$AuthViewStateImpl _value, $Res Function(_$AuthViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? status = null,
    Object? activeScreen = null,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthViewStateImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthPageStatus,
      activeScreen: null == activeScreen
          ? _value.activeScreen
          : activeScreen // ignore: cast_nullable_to_non_nullable
              as AuthPageScreen,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthViewStateImpl implements _AuthViewState {
  const _$AuthViewStateImpl(
      {this.username = '',
      this.password = '',
      this.confirmPassword = '',
      this.status = AuthPageStatus.initial,
      this.activeScreen = AuthPageScreen.login,
      this.showPassword = false,
      this.showConfirmPassword = false,
      this.errorMessage});

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final AuthPageStatus status;
  @override
  @JsonKey()
  final AuthPageScreen activeScreen;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool showConfirmPassword;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthViewState(username: $username, password: $password, confirmPassword: $confirmPassword, status: $status, activeScreen: $activeScreen, showPassword: $showPassword, showConfirmPassword: $showConfirmPassword, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthViewStateImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeScreen, activeScreen) ||
                other.activeScreen == activeScreen) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.showConfirmPassword, showConfirmPassword) ||
                other.showConfirmPassword == showConfirmPassword) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      password,
      confirmPassword,
      status,
      activeScreen,
      showPassword,
      showConfirmPassword,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthViewStateImplCopyWith<_$AuthViewStateImpl> get copyWith =>
      __$$AuthViewStateImplCopyWithImpl<_$AuthViewStateImpl>(this, _$identity);
}

abstract class _AuthViewState implements AuthViewState {
  const factory _AuthViewState(
      {final String username,
      final String password,
      final String confirmPassword,
      final AuthPageStatus status,
      final AuthPageScreen activeScreen,
      final bool showPassword,
      final bool showConfirmPassword,
      final String? errorMessage}) = _$AuthViewStateImpl;

  @override
  String get username;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  AuthPageStatus get status;
  @override
  AuthPageScreen get activeScreen;
  @override
  bool get showPassword;
  @override
  bool get showConfirmPassword;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthViewStateImplCopyWith<_$AuthViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
