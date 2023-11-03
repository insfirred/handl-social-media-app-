import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/ui/chats/chats_view_model.dart';

import '../../models/message.dart';
import '../../models/user_data.dart';
import '../../services/cloud_firestore.dart';
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
  final StateNotifierProviderRef ref;
  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> _subscription;

  SingleChatViewModel({
    required this.firebaseAuth,
    required this.fireStore,
    required this.ref,
  }) : super(const SingleChatViewState()) {
    setChatUser(ref.read(chatsViewModelProvider).selectedChatUser!);
    state = state.copyWith(status: SingleChatViewStatus.loading);
    try {
      _subscription = fireStore
          .collection('chats')
          .doc(
            _getChatDocId(
              ref.read(appRepositoryProvider).authUser!.uid,
              state.chatUser!.id,
            ),
          )
          .snapshots()
          .listen(
        (snapshot) {
          if (snapshot.exists) {
            List messagesListJson = snapshot.data()!['all_messages_list'];
            List<Message> messagesList =
                messagesListJson.map((json) => Message.fromJson(json)).toList();

            // sorting the list according to time
            messagesList.sort(
              (a, b) => a.createdAt.compareTo(b.createdAt),
            );

            // reversing the list
            messagesList = List.from(messagesList.reversed);

            state = state.copyWith(
              messagesList: messagesList,
              status: SingleChatViewStatus.loaded,
            );
            ref.read(chatsViewModelProvider.notifier).refreshChatView();
          } else {
            state = state.copyWith(status: SingleChatViewStatus.loaded);
          }
        },
      );
    } catch (e) {
      _setError(e.toString());
      state = state.copyWith(status: SingleChatViewStatus.error);
      print(e);
    }
  }

  setChatUser(UserData userData) => state = state.copyWith(chatUser: userData);

  setTextFieldValue(String val) => state = state.copyWith(
        textFieldValue: val,
        status: SingleChatViewStatus.initial,
      );

  sendMessage() async {
    if (state.textFieldValue == null || state.textFieldValue?.trim() == '') {
      return;
    }
    try {
      final List<Message> updatedMessageList = [];

      for (var element in state.messagesList) {
        updatedMessageList.add(element);
      }

      updatedMessageList.add(
        Message(
          createdAt: DateTime.now(),
          from: ref.read(appRepositoryProvider).authUser!.uid,
          to: state.chatUser!.id,
          messageText: state.textFieldValue?.trim() ?? '',
        ),
      );

      final List<Map<String, dynamic>> updatedMessagesListJson =
          updatedMessageList.map((obj) => obj.toJson()).toList();

      await fireStore
          .collection('chats')
          .doc(
            _getChatDocId(
              ref.read(appRepositoryProvider).authUser!.uid,
              state.chatUser!.id,
            ),
          )
          .set(
        {
          "all_messages_list": updatedMessagesListJson,
          "last_message":
              updatedMessageList[updatedMessageList.length - 1].toJson(),
          "user1": ref.read(appRepositoryProvider).userData!.username,
          "user2": state.chatUser!.username,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      _setError(e.toString());
      print(e);
    }
  }

  String _getChatDocId(String id1, String id2) =>
      (id1.compareTo(id2) < 0) ? '$id1-$id2' : '$id2-$id1';

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: SingleChatViewStatus.error,
      );

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}

@freezed
class SingleChatViewState with _$SingleChatViewState {
  const factory SingleChatViewState({
    UserData? chatUser,
    String? textFieldValue,
    @Default([]) List<Message> messagesList,
    @Default(SingleChatViewStatus.initial) SingleChatViewStatus status,
    String? errorMessage,
  }) = _SingleChatViewState;
}

enum SingleChatViewStatus {
  initial,
  loading,
  loaded,
  error,
}
