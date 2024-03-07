import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/enums_handl.dart';
import '../../models/post.dart';
import '../../repositories/app_repository.dart';
import '../../services/cloud_firestore.dart';

part 'upload_post_view_model.freezed.dart';

final uploadPostViewModelProvider =
    StateNotifierProvider.autoDispose<UploadPostViewModel, UploadPostViewState>(
  (ref) => UploadPostViewModel(
    fireStore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class UploadPostViewModel extends StateNotifier<UploadPostViewState> {
  final FirebaseFirestore fireStore;
  final StateNotifierProviderRef ref;

  UploadPostViewModel({
    required this.fireStore,
    required this.ref,
  }) : super(const UploadPostViewState());

  setTweetText(String val) => state = state.copyWith(tweetText: val);
  setImageFile(File? image) => state = state.copyWith(imageFile: image);
  setImageCaption(String? caption) => state = state.copyWith(
        imageCaption: caption,
      );

  setUploadPostScreen(UploadPostScreen screen) =>
      state = state.copyWith(screen: screen);

  Future<bool> uploadTweet() async {
    try {
      if (!_tweetValidation()) {
        _setError("Tweet cannot be empty");
        return false;
      }
      print('validation successfull');
      state = state.copyWith(status: UploadPostViewStatus.loading);
      Post tweet = Post(
        type: PostType.tweet,
        text: state.tweetText!,
        createdAt: DateTime.now(),
        createdById: ref.read(appRepositoryProvider).authUser!.uid,
        createdByName: ref.read(appRepositoryProvider).userData!.username,
        createdByPic: ref.read(appRepositoryProvider).userData!.imageUrl,
        likes: 0,
        likedBy: [],
        isBookmarked: false,
      );

      print('tweet created');
      await fireStore.collection('posts').add(tweet.toJson()).then(
            (post) => post.set(
              {"id": post.id},
              SetOptions(merge: true),
            ),
          );

      print('tweet uploaded');
      state = state.copyWith(status: UploadPostViewStatus.uploaded);
      return true;
    } catch (e) {
      _setError(e.toString());
      print(e);
    }
    return false;
  }

  // pickImageFile() async {}

  bool _tweetValidation() {
    if (state.tweetText == null) return false;
    if (state.tweetText!.trim() == "") return false;
    return true;
  }

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: UploadPostViewStatus.error,
      );
}

@freezed
class UploadPostViewState with _$UploadPostViewState {
  const factory UploadPostViewState({
    String? tweetText,
    String? imageCaption,
    File? imageFile,
    @Default(UploadPostViewStatus.initial) UploadPostViewStatus status,
    @Default(UploadPostScreen.tweet) UploadPostScreen screen,
    String? errorMessage,
  }) = _UploadPostViewState;
}

enum UploadPostViewStatus {
  initial,
  loading,
  uploaded,
  error,
}

enum UploadPostScreen {
  tweet,
  image,
}
