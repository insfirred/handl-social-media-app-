// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatsViewState {
  ChatsViewStatus get status => throw _privateConstructorUsedError;
  List<UserData> get userDataList => throw _privateConstructorUsedError;
  List<UserData> get recentChatUsers => throw _privateConstructorUsedError;
  UserData? get selectedChatUser => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatsViewStateCopyWith<ChatsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsViewStateCopyWith<$Res> {
  factory $ChatsViewStateCopyWith(
          ChatsViewState value, $Res Function(ChatsViewState) then) =
      _$ChatsViewStateCopyWithImpl<$Res, ChatsViewState>;
  @useResult
  $Res call(
      {ChatsViewStatus status,
      List<UserData> userDataList,
      List<UserData> recentChatUsers,
      UserData? selectedChatUser,
      String? errorMessage});
}

/// @nodoc
class _$ChatsViewStateCopyWithImpl<$Res, $Val extends ChatsViewState>
    implements $ChatsViewStateCopyWith<$Res> {
  _$ChatsViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userDataList = null,
    Object? recentChatUsers = null,
    Object? selectedChatUser = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatsViewStatus,
      userDataList: null == userDataList
          ? _value.userDataList
          : userDataList // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      recentChatUsers: null == recentChatUsers
          ? _value.recentChatUsers
          : recentChatUsers // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      selectedChatUser: freezed == selectedChatUser
          ? _value.selectedChatUser
          : selectedChatUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatsViewStateImplCopyWith<$Res>
    implements $ChatsViewStateCopyWith<$Res> {
  factory _$$ChatsViewStateImplCopyWith(_$ChatsViewStateImpl value,
          $Res Function(_$ChatsViewStateImpl) then) =
      __$$ChatsViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChatsViewStatus status,
      List<UserData> userDataList,
      List<UserData> recentChatUsers,
      UserData? selectedChatUser,
      String? errorMessage});
}

/// @nodoc
class __$$ChatsViewStateImplCopyWithImpl<$Res>
    extends _$ChatsViewStateCopyWithImpl<$Res, _$ChatsViewStateImpl>
    implements _$$ChatsViewStateImplCopyWith<$Res> {
  __$$ChatsViewStateImplCopyWithImpl(
      _$ChatsViewStateImpl _value, $Res Function(_$ChatsViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userDataList = null,
    Object? recentChatUsers = null,
    Object? selectedChatUser = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ChatsViewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatsViewStatus,
      userDataList: null == userDataList
          ? _value._userDataList
          : userDataList // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      recentChatUsers: null == recentChatUsers
          ? _value._recentChatUsers
          : recentChatUsers // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      selectedChatUser: freezed == selectedChatUser
          ? _value.selectedChatUser
          : selectedChatUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatsViewStateImpl implements _ChatsViewState {
  const _$ChatsViewStateImpl(
      {this.status = ChatsViewStatus.initial,
      final List<UserData> userDataList = const [],
      final List<UserData> recentChatUsers = const [],
      this.selectedChatUser,
      this.errorMessage})
      : _userDataList = userDataList,
        _recentChatUsers = recentChatUsers;

  @override
  @JsonKey()
  final ChatsViewStatus status;
  final List<UserData> _userDataList;
  @override
  @JsonKey()
  List<UserData> get userDataList {
    if (_userDataList is EqualUnmodifiableListView) return _userDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userDataList);
  }

  final List<UserData> _recentChatUsers;
  @override
  @JsonKey()
  List<UserData> get recentChatUsers {
    if (_recentChatUsers is EqualUnmodifiableListView) return _recentChatUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentChatUsers);
  }

  @override
  final UserData? selectedChatUser;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatsViewState(status: $status, userDataList: $userDataList, recentChatUsers: $recentChatUsers, selectedChatUser: $selectedChatUser, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsViewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._userDataList, _userDataList) &&
            const DeepCollectionEquality()
                .equals(other._recentChatUsers, _recentChatUsers) &&
            (identical(other.selectedChatUser, selectedChatUser) ||
                other.selectedChatUser == selectedChatUser) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_userDataList),
      const DeepCollectionEquality().hash(_recentChatUsers),
      selectedChatUser,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsViewStateImplCopyWith<_$ChatsViewStateImpl> get copyWith =>
      __$$ChatsViewStateImplCopyWithImpl<_$ChatsViewStateImpl>(
          this, _$identity);
}

abstract class _ChatsViewState implements ChatsViewState {
  const factory _ChatsViewState(
      {final ChatsViewStatus status,
      final List<UserData> userDataList,
      final List<UserData> recentChatUsers,
      final UserData? selectedChatUser,
      final String? errorMessage}) = _$ChatsViewStateImpl;

  @override
  ChatsViewStatus get status;
  @override
  List<UserData> get userDataList;
  @override
  List<UserData> get recentChatUsers;
  @override
  UserData? get selectedChatUser;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatsViewStateImplCopyWith<_$ChatsViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
