// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_post_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadPostViewState {
  String? get tweetText => throw _privateConstructorUsedError;
  String? get imageCaption => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;
  UploadPostViewStatus get status => throw _privateConstructorUsedError;
  UploadPostScreen get screen => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadPostViewStateCopyWith<UploadPostViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPostViewStateCopyWith<$Res> {
  factory $UploadPostViewStateCopyWith(
          UploadPostViewState value, $Res Function(UploadPostViewState) then) =
      _$UploadPostViewStateCopyWithImpl<$Res, UploadPostViewState>;
  @useResult
  $Res call(
      {String? tweetText,
      String? imageCaption,
      File? imageFile,
      UploadPostViewStatus status,
      UploadPostScreen screen,
      String? errorMessage});
}

/// @nodoc
class _$UploadPostViewStateCopyWithImpl<$Res, $Val extends UploadPostViewState>
    implements $UploadPostViewStateCopyWith<$Res> {
  _$UploadPostViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweetText = freezed,
    Object? imageCaption = freezed,
    Object? imageFile = freezed,
    Object? status = null,
    Object? screen = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      tweetText: freezed == tweetText
          ? _value.tweetText
          : tweetText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCaption: freezed == imageCaption
          ? _value.imageCaption
          : imageCaption // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UploadPostViewStatus,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as UploadPostScreen,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPostViewStateImplCopyWith<$Res>
    implements $UploadPostViewStateCopyWith<$Res> {
  factory _$$UploadPostViewStateImplCopyWith(_$UploadPostViewStateImpl value,
          $Res Function(_$UploadPostViewStateImpl) then) =
      __$$UploadPostViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tweetText,
      String? imageCaption,
      File? imageFile,
      UploadPostViewStatus status,
      UploadPostScreen screen,
      String? errorMessage});
}

/// @nodoc
class __$$UploadPostViewStateImplCopyWithImpl<$Res>
    extends _$UploadPostViewStateCopyWithImpl<$Res, _$UploadPostViewStateImpl>
    implements _$$UploadPostViewStateImplCopyWith<$Res> {
  __$$UploadPostViewStateImplCopyWithImpl(_$UploadPostViewStateImpl _value,
      $Res Function(_$UploadPostViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweetText = freezed,
    Object? imageCaption = freezed,
    Object? imageFile = freezed,
    Object? status = null,
    Object? screen = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$UploadPostViewStateImpl(
      tweetText: freezed == tweetText
          ? _value.tweetText
          : tweetText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCaption: freezed == imageCaption
          ? _value.imageCaption
          : imageCaption // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UploadPostViewStatus,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as UploadPostScreen,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UploadPostViewStateImpl implements _UploadPostViewState {
  const _$UploadPostViewStateImpl(
      {this.tweetText,
      this.imageCaption,
      this.imageFile,
      this.status = UploadPostViewStatus.initial,
      this.screen = UploadPostScreen.tweet,
      this.errorMessage});

  @override
  final String? tweetText;
  @override
  final String? imageCaption;
  @override
  final File? imageFile;
  @override
  @JsonKey()
  final UploadPostViewStatus status;
  @override
  @JsonKey()
  final UploadPostScreen screen;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UploadPostViewState(tweetText: $tweetText, imageCaption: $imageCaption, imageFile: $imageFile, status: $status, screen: $screen, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPostViewStateImpl &&
            (identical(other.tweetText, tweetText) ||
                other.tweetText == tweetText) &&
            (identical(other.imageCaption, imageCaption) ||
                other.imageCaption == imageCaption) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tweetText, imageCaption,
      imageFile, status, screen, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPostViewStateImplCopyWith<_$UploadPostViewStateImpl> get copyWith =>
      __$$UploadPostViewStateImplCopyWithImpl<_$UploadPostViewStateImpl>(
          this, _$identity);
}

abstract class _UploadPostViewState implements UploadPostViewState {
  const factory _UploadPostViewState(
      {final String? tweetText,
      final String? imageCaption,
      final File? imageFile,
      final UploadPostViewStatus status,
      final UploadPostScreen screen,
      final String? errorMessage}) = _$UploadPostViewStateImpl;

  @override
  String? get tweetText;
  @override
  String? get imageCaption;
  @override
  File? get imageFile;
  @override
  UploadPostViewStatus get status;
  @override
  UploadPostScreen get screen;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UploadPostViewStateImplCopyWith<_$UploadPostViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
