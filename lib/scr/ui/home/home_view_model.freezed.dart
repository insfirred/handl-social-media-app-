// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeViewState {
  List<Post> get posts => throw _privateConstructorUsedError;
  String? get likedPostId => throw _privateConstructorUsedError;
  HomeViewStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewStateCopyWith<HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
          HomeViewState value, $Res Function(HomeViewState) then) =
      _$HomeViewStateCopyWithImpl<$Res, HomeViewState>;
  @useResult
  $Res call(
      {List<Post> posts,
      String? likedPostId,
      HomeViewStatus status,
      String? errorMessage});
}

/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res, $Val extends HomeViewState>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? likedPostId = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      likedPostId: freezed == likedPostId
          ? _value.likedPostId
          : likedPostId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeViewStateImplCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$$HomeViewStateImplCopyWith(
          _$HomeViewStateImpl value, $Res Function(_$HomeViewStateImpl) then) =
      __$$HomeViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Post> posts,
      String? likedPostId,
      HomeViewStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$HomeViewStateImplCopyWithImpl<$Res>
    extends _$HomeViewStateCopyWithImpl<$Res, _$HomeViewStateImpl>
    implements _$$HomeViewStateImplCopyWith<$Res> {
  __$$HomeViewStateImplCopyWithImpl(
      _$HomeViewStateImpl _value, $Res Function(_$HomeViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? likedPostId = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$HomeViewStateImpl(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      likedPostId: freezed == likedPostId
          ? _value.likedPostId
          : likedPostId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeViewStateImpl implements _HomeViewState {
  const _$HomeViewStateImpl(
      {final List<Post> posts = const [],
      this.likedPostId,
      this.status = HomeViewStatus.initial,
      this.errorMessage})
      : _posts = posts;

  final List<Post> _posts;
  @override
  @JsonKey()
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final String? likedPostId;
  @override
  @JsonKey()
  final HomeViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeViewState(posts: $posts, likedPostId: $likedPostId, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewStateImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.likedPostId, likedPostId) ||
                other.likedPostId == likedPostId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      likedPostId,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      __$$HomeViewStateImplCopyWithImpl<_$HomeViewStateImpl>(this, _$identity);
}

abstract class _HomeViewState implements HomeViewState {
  const factory _HomeViewState(
      {final List<Post> posts,
      final String? likedPostId,
      final HomeViewStatus status,
      final String? errorMessage}) = _$HomeViewStateImpl;

  @override
  List<Post> get posts;
  @override
  String? get likedPostId;
  @override
  HomeViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
