// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/user_data.dart';
import 'package:social_media/scr/services/cloud_firestore.dart';

import '../../services/firebase_auth.dart';

part 'chats_view_model.freezed.dart';

final chatsViewModelProvider =
    StateNotifierProvider.autoDispose<ChatsViewModel, ChatsViewState>(
  (ref) => ChatsViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);

class ChatsViewModel extends StateNotifier<ChatsViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  ChatsViewModel({
    required this.firebaseAuth,
    required this.firestore,
  }) : super(const ChatsViewState()) {
    _fetchAllUsers();
  }

  setChatUserForSingleChatViewModel(UserData user) =>
      state = state.copyWith(selectedChatUser: user);

  _fetchAllUsers() async {
    state = state.copyWith(status: ChatsViewStatus.loading);
    try {
      final usersCollection = firestore.collection('users');
      await usersCollection.get().then(
        (data) {
          List<UserData> userDataList = data.docs
              .map((snapshot) => UserData.fromJson(snapshot.data()))
              .toList();
          state = state.copyWith(
            userDataList: userDataList,
            status: ChatsViewStatus.loaded,
          );
        },
      );
    } catch (e) {
      _setError(e.toString());
    }
  }

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: ChatsViewStatus.error,
      );
}

@freezed
class ChatsViewState with _$ChatsViewState {
  const factory ChatsViewState({
    @Default(ChatsViewStatus.initial) ChatsViewStatus status,
    @Default([]) List<UserData> userDataList,
    UserData? selectedChatUser,
    String? errorMessage,
  }) = _ChatsViewState;
}

enum ChatsViewStatus {
  initial,
  loading,
  loaded,
  error,
}
