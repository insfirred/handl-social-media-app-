// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_username_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateUsernameViewState {
  String get username => throw _privateConstructorUsedError;
  CreateUsernameViewStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUsernameViewStateCopyWith<CreateUsernameViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUsernameViewStateCopyWith<$Res> {
  factory $CreateUsernameViewStateCopyWith(CreateUsernameViewState value,
          $Res Function(CreateUsernameViewState) then) =
      _$CreateUsernameViewStateCopyWithImpl<$Res, CreateUsernameViewState>;
  @useResult
  $Res call(
      {String username, CreateUsernameViewStatus status, String? errorMessage});
}

/// @nodoc
class _$CreateUsernameViewStateCopyWithImpl<$Res,
        $Val extends CreateUsernameViewState>
    implements $CreateUsernameViewStateCopyWith<$Res> {
  _$CreateUsernameViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateUsernameViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUsernameViewStateImplCopyWith<$Res>
    implements $CreateUsernameViewStateCopyWith<$Res> {
  factory _$$CreateUsernameViewStateImplCopyWith(
          _$CreateUsernameViewStateImpl value,
          $Res Function(_$CreateUsernameViewStateImpl) then) =
      __$$CreateUsernameViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username, CreateUsernameViewStatus status, String? errorMessage});
}

/// @nodoc
class __$$CreateUsernameViewStateImplCopyWithImpl<$Res>
    extends _$CreateUsernameViewStateCopyWithImpl<$Res,
        _$CreateUsernameViewStateImpl>
    implements _$$CreateUsernameViewStateImplCopyWith<$Res> {
  __$$CreateUsernameViewStateImplCopyWithImpl(
      _$CreateUsernameViewStateImpl _value,
      $Res Function(_$CreateUsernameViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CreateUsernameViewStateImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateUsernameViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateUsernameViewStateImpl implements _CreateUsernameViewState {
  const _$CreateUsernameViewStateImpl(
      {this.username = '',
      this.status = CreateUsernameViewStatus.initial,
      this.errorMessage});

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final CreateUsernameViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreateUsernameViewState(username: $username, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUsernameViewStateImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUsernameViewStateImplCopyWith<_$CreateUsernameViewStateImpl>
      get copyWith => __$$CreateUsernameViewStateImplCopyWithImpl<
          _$CreateUsernameViewStateImpl>(this, _$identity);
}

abstract class _CreateUsernameViewState implements CreateUsernameViewState {
  const factory _CreateUsernameViewState(
      {final String username,
      final CreateUsernameViewStatus status,
      final String? errorMessage}) = _$CreateUsernameViewStateImpl;

  @override
  String get username;
  @override
  CreateUsernameViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$CreateUsernameViewStateImplCopyWith<_$CreateUsernameViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
