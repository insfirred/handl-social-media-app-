import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/chat_data.dart';
import 'package:social_media/scr/models/message.dart';
import 'package:social_media/scr/models/user_data.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/services/cloud_firestore.dart';

import '../../services/firebase_auth.dart';

part 'chats_view_model.freezed.dart';

final chatsViewModelProvider =
    StateNotifierProvider.autoDispose<ChatsViewModel, ChatsViewState>(
  (ref) => ChatsViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class ChatsViewModel extends StateNotifier<ChatsViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final StateNotifierProviderRef ref;

  ChatsViewModel({
    required this.firebaseAuth,
    required this.firestore,
    required this.ref,
  }) : super(const ChatsViewState()) {
    _fetchAllUsers();
    _fetchRecentChatsData();
  }

  setChatUserForSingleChatViewModel(UserData user) =>
      state = state.copyWith(selectedChatUser: user);

  refreshChatView() {
    _fetchAllUsers();
    _fetchRecentChatsData();
  }

  _fetchAllUsers() async {
    state = state.copyWith(status: ChatsViewStatus.loading);
    try {
      final usersCollection = firestore.collection('users');
      await usersCollection.get().then(
        (data) {
          List<UserData> userDataList = data.docs
              .map((snapshot) => UserData.fromJson(snapshot.data()))
              .toList();

          // removing the self from the list
          userDataList.removeWhere((element) =>
              element.id == ref.read(appRepositoryProvider).authUser!.uid);

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

  _fetchRecentChatsData() async {
    state = state.copyWith(status: ChatsViewStatus.loading);
    try {
      final usersCollection = firestore.collection('chats');
      await usersCollection.get().then(
        (data) {
          data.docs.forEach((element) {
            print(element.data());
          });
          List<ChatData> allChatsData = data.docs.map(
            (snapshot) {
              Map<String, dynamic> data = snapshot.data();
              List allMessagesListJson = data['all_messages_list'];
              List<Message> allMessagesList =
                  allMessagesListJson.map((i) => Message.fromJson(i)).toList();
              Map<String, dynamic> lastMessageJson = data['last_message'];
              Message lastMessage = Message.fromJson(lastMessageJson);
              String user1 = data['user1'];
              String user2 = data['user2'];

              return ChatData(
                lastMessage: lastMessage,
                allMessagesList: allMessagesList,
                user1: user1,
                user2: user2,
              );
            },
          ).toList();

          String selfUid = ref.read(appRepositoryProvider).authUser!.uid;
          List<ChatData> recentChatsData = [];
          for (int i = 0; i < allChatsData.length; i++) {
            if (allChatsData[i].lastMessage.from == selfUid ||
                allChatsData[i].lastMessage.to == selfUid) {
              recentChatsData.add(allChatsData[i]);
            }
          }

          state = state.copyWith(
            recentChats: recentChatsData,
            status: ChatsViewStatus.loaded,
          );
        },
      );
    } catch (e) {
      _setError(e.toString());
      print(e.toString());
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
    @Default([]) List<ChatData> recentChats,
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
