// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_chat_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleChatViewState {
  UserData? get chatUser => throw _privateConstructorUsedError;
  String? get textFieldValue => throw _privateConstructorUsedError;
  List<Message> get messagesList => throw _privateConstructorUsedError;
  SingleChatViewStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleChatViewStateCopyWith<SingleChatViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleChatViewStateCopyWith<$Res> {
  factory $SingleChatViewStateCopyWith(
          SingleChatViewState value, $Res Function(SingleChatViewState) then) =
      _$SingleChatViewStateCopyWithImpl<$Res, SingleChatViewState>;
  @useResult
  $Res call(
      {UserData? chatUser,
      String? textFieldValue,
      List<Message> messagesList,
      SingleChatViewStatus status,
      String? errorMessage});
}

/// @nodoc
class _$SingleChatViewStateCopyWithImpl<$Res, $Val extends SingleChatViewState>
    implements $SingleChatViewStateCopyWith<$Res> {
  _$SingleChatViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatUser = freezed,
    Object? textFieldValue = freezed,
    Object? messagesList = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      chatUser: freezed == chatUser
          ? _value.chatUser
          : chatUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      textFieldValue: freezed == textFieldValue
          ? _value.textFieldValue
          : textFieldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      messagesList: null == messagesList
          ? _value.messagesList
          : messagesList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SingleChatViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleChatViewStateImplCopyWith<$Res>
    implements $SingleChatViewStateCopyWith<$Res> {
  factory _$$SingleChatViewStateImplCopyWith(_$SingleChatViewStateImpl value,
          $Res Function(_$SingleChatViewStateImpl) then) =
      __$$SingleChatViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData? chatUser,
      String? textFieldValue,
      List<Message> messagesList,
      SingleChatViewStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$SingleChatViewStateImplCopyWithImpl<$Res>
    extends _$SingleChatViewStateCopyWithImpl<$Res, _$SingleChatViewStateImpl>
    implements _$$SingleChatViewStateImplCopyWith<$Res> {
  __$$SingleChatViewStateImplCopyWithImpl(_$SingleChatViewStateImpl _value,
      $Res Function(_$SingleChatViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatUser = freezed,
    Object? textFieldValue = freezed,
    Object? messagesList = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SingleChatViewStateImpl(
      chatUser: freezed == chatUser
          ? _value.chatUser
          : chatUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      textFieldValue: freezed == textFieldValue
          ? _value.textFieldValue
          : textFieldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      messagesList: null == messagesList
          ? _value._messagesList
          : messagesList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SingleChatViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SingleChatViewStateImpl implements _SingleChatViewState {
  const _$SingleChatViewStateImpl(
      {this.chatUser,
      this.textFieldValue,
      final List<Message> messagesList = const [],
      this.status = SingleChatViewStatus.initial,
      this.errorMessage})
      : _messagesList = messagesList;

  @override
  final UserData? chatUser;
  @override
  final String? textFieldValue;
  final List<Message> _messagesList;
  @override
  @JsonKey()
  List<Message> get messagesList {
    if (_messagesList is EqualUnmodifiableListView) return _messagesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messagesList);
  }

  @override
  @JsonKey()
  final SingleChatViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SingleChatViewState(chatUser: $chatUser, textFieldValue: $textFieldValue, messagesList: $messagesList, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleChatViewStateImpl &&
            (identical(other.chatUser, chatUser) ||
                other.chatUser == chatUser) &&
            (identical(other.textFieldValue, textFieldValue) ||
                other.textFieldValue == textFieldValue) &&
            const DeepCollectionEquality()
                .equals(other._messagesList, _messagesList) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatUser, textFieldValue,
      const DeepCollectionEquality().hash(_messagesList), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleChatViewStateImplCopyWith<_$SingleChatViewStateImpl> get copyWith =>
      __$$SingleChatViewStateImplCopyWithImpl<_$SingleChatViewStateImpl>(
          this, _$identity);
}

abstract class _SingleChatViewState implements SingleChatViewState {
  const factory _SingleChatViewState(
      {final UserData? chatUser,
      final String? textFieldValue,
      final List<Message> messagesList,
      final SingleChatViewStatus status,
      final String? errorMessage}) = _$SingleChatViewStateImpl;

  @override
  UserData? get chatUser;
  @override
  String? get textFieldValue;
  @override
  List<Message> get messagesList;
  @override
  SingleChatViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SingleChatViewStateImplCopyWith<_$SingleChatViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
