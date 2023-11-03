import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/post.dart';
import 'package:social_media/scr/repositories/app_repository.dart';

import '../../services/cloud_firestore.dart';
import '../../services/firebase_auth.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeViewState>(
  (ref) => HomeViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    fireStore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class HomeViewModel extends StateNotifier<HomeViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;
  final StateNotifierProviderRef ref;
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _subscription;

  HomeViewModel({
    required this.firebaseAuth,
    required this.fireStore,
    required this.ref,
  }) : super(const HomeViewState()) {
    _fetchingPosts();
  }

  /// when user tapped the like button (heart button)
  likeBtnTapped() async {
    state = state.copyWith(status: HomeViewStatus.initial);
    try {
      await fireStore.collection('posts').doc(state.likedPostId).get().then(
        (value) {
          List likedBy = value.data()?['liked_by'];
          if (likedBy.contains(ref.read(appRepositoryProvider).authUser!.uid)) {
            // UNLIKE
            likedBy.remove(ref.read(appRepositoryProvider).authUser!.uid);
          } else {
            // LIKE
            likedBy.add(ref.read(appRepositoryProvider).authUser!.uid);
          }

          value.reference.set(
            {
              'liked_by': likedBy,
              'likes': likedBy.length,
            },
            SetOptions(merge: true),
          );
        },
      );
    } catch (e) {
      print(e);
      _setError(e.toString());
    }
  }

  setLikedPostId(String id) => state = state.copyWith(
        likedPostId: id,
      );

  _fetchingPosts() async {
    state = state.copyWith(status: HomeViewStatus.loading);

    try {
      print('Listening Snapshots');

      _subscription = fireStore
          .collection('posts')
          .orderBy('created_at', descending: true)
          .snapshots()
          .listen(
        (snapshot) {
          print('Home View Loading');
          print(snapshot.size);
          if (snapshot.size == 0) {
            print('No posts here!!!!!!!!!!!!');
            state = state.copyWith(status: HomeViewStatus.loaded);
          } else {
            print('Fetching!!!!!!!!');
            List<Post> posts = [];
            print(snapshot.docs.length);
            for (var doc in snapshot.docs) {
              posts.add(Post.fromJson(doc.data()));
              print('yes');
            }

            state = state.copyWith(
              posts: posts,
              status: HomeViewStatus.loaded,
            );
            print('Posts fetched!!!!!!!!!!');
          }
        },
      );
    } catch (e) {
      _setError(e.toString());
      state = state.copyWith(status: HomeViewStatus.error);
      print(e);
    }
  }

  _setError(String? error) => state = state.copyWith(
        status: HomeViewStatus.error,
        errorMessage: error,
      );

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<Post> posts,
    String? likedPostId,
    @Default(HomeViewStatus.initial) HomeViewStatus status,
    String? errorMessage,
  }) = _HomeViewState;
}

enum HomeViewStatus {
  initial,
  loading,
  loaded,
  error,
}
