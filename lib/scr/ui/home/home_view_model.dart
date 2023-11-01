import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/tweet.dart';

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
  // late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> _subscription;

  HomeViewModel({
    required this.firebaseAuth,
    required this.fireStore,
    required this.ref,
  }) : super(const HomeViewState()) {
    // setChatUser(ref.read(chatsViewModelProvider).selectedChatUser!);
    // state = state.copyWith(status: HomeViewStatus.loading);
    // try {
    //   _subscription = fireStore
    //       .collection('chats')
    //       .doc(
    //         _getChatDocId(
    //           ref.read(appRepositoryProvider).authUser!.uid,
    //           state.chatUser!.id,
    //         ),
    //       )
    //       .snapshots()
    //       .listen(
    //     (snapshot) {
    //       if (snapshot.exists) {
    //         List messagesListJson = snapshot.data()!['all_messages_list'];
    //         List<Message> messagesList =
    //             messagesListJson.map((json) => Message.fromJson(json)).toList();

    //         // sorting the list according to time
    //         messagesList.sort(
    //           (a, b) => a.createdAt.compareTo(b.createdAt),
    //         );

    //         // reversing the list
    //         messagesList = List.from(messagesList.reversed);

    //         state = state.copyWith(
    //           messagesList: messagesList,
    //           status: SingleChatViewStatus.loaded,
    //         );
    //         ref.read(chatsViewModelProvider.notifier).refreshChatView();
    //       } else {
    //         state = state.copyWith(status: SingleChatViewStatus.loaded);
    //       }
    //     },
    //   );
    // } catch (e) {
    //   _setError(e.toString());
    //   state = state.copyWith(status: SingleChatViewStatus.error);
    //   print(e);
    // }
  }
}

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<Tweet> tweetsList,
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
