import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/user_data.dart';
import 'package:social_media/scr/services/cloud_firestore.dart';

import '../../services/firebase_auth.dart';

part 'single_chat_view_model.freezed.dart';

final singleChatViewModelProvider =
    StateNotifierProvider.autoDispose<SingleChatViewModel, SingleChatViewState>(
  (ref) => SingleChatViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    fireStore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class SingleChatViewModel extends StateNotifier<SingleChatViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;
  final AutoDisposeStateNotifierProviderRef ref;

  SingleChatViewModel({
    required this.firebaseAuth,
    required this.fireStore,
    required this.ref,
  }) : super(const SingleChatViewState());

  setChatUserId(UserData userData) => state = state.copyWith(
        chatUser: userData,
      );

  // // setCreateUsernameViewStatus(CreateUsernameViewStatus status) =>
  // //     state = state.copyWith(status: status);

  // createUserName() async {
  //   if (!_validationOnUsername()) return;
  //   try {
  //     Map<String, dynamic> userJson = UserData(
  //       id: ref.read(appRepositoryProvider).authUser!.uid,
  //       username: state.username,
  //       email: ref.read(appRepositoryProvider).authUser!.email!,
  //       dateCreated: DateTime.now(),
  //     ).toJson();
  //     final currentUserId = ref.read(appRepositoryProvider).authUser!.uid;
  //     final userCollection = fireStore.collection('users');
  //     await userCollection.doc(currentUserId).set(userJson);
  //     ref
  //         .read(appRepositoryProvider.notifier)
  //         .setAppStatus(AppStatus.authenticatedWithUserData);
  //     ref
  //         .read(appRepositoryProvider.notifier)
  //         .setUserData(UserData.fromJson(userJson));
  //   } catch (e) {
  //     _setError(e.toString());
  //     print(e);
  //   }
  // }

  // /// returns true if there is no validation error
  // bool _validationOnUsername() {
  //   if (state.username.isEmpty) {
  //     _setError('Enter your username');
  //     print('Enter your username');
  //     return false;
  //   }
  //   if (state.username.length < 3) {
  //     _setError('Username is too short');
  //     print('Username is too short');
  //     return false;
  //   }
  //   if (state.username.length > 14) {
  //     _setError('Your username should consist of 3-14 characters');
  //     print('Your username should consist of 3-14 characters');
  //     return false;
  //   }
  //   return true;
  // }

  // _setError(String? error) => state = state.copyWith(
  //       errorMessage: error,
  //       status: CreateUsernameViewStatus.error,
  //     );
}

@freezed
class SingleChatViewState with _$SingleChatViewState {
  const factory SingleChatViewState({
    UserData? chatUser,
    @Default(SingleUsernameViewStatus.initial) SingleUsernameViewStatus status,
    String? errorMessage,
  }) = _SingleChatViewState;
}

enum SingleUsernameViewStatus {
  initial,
  loading,
  loaded,
  error,
}
