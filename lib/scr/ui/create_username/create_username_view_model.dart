// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/user_data.dart';
import 'package:social_media/scr/repositories/app_repository.dart';
import 'package:social_media/scr/services/cloud_firestore.dart';

import '../../services/firebase_auth.dart';

part 'create_username_view_model.freezed.dart';

final createUsernameViewModelProvider = StateNotifierProvider.autoDispose<
    CreateUsernameViewModel, CreateUsernameViewState>(
  (ref) => CreateUsernameViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    fireStore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class CreateUsernameViewModel extends StateNotifier<CreateUsernameViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;
  final AutoDisposeStateNotifierProviderRef ref;

  CreateUsernameViewModel({
    required this.firebaseAuth,
    required this.fireStore,
    required this.ref,
  }) : super(const CreateUsernameViewState());

  setUsername(String username) => state = state.copyWith(
        username: username,
        status: CreateUsernameViewStatus.initial,
      );

  /// creates a user model in firestore users collection
  createUserName() async {
    if (!_validationOnUsername()) return;
    try {
      Map<String, dynamic> userJson = UserData(
        id: ref.read(appRepositoryProvider).authUser!.uid,
        username: state.username,
        email: ref.read(appRepositoryProvider).authUser!.email!,
        dateCreated: DateTime.now(),
      ).toJson();
      final currentUserId = ref.read(appRepositoryProvider).authUser!.uid;
      final userCollection = fireStore.collection('users');
      await userCollection.doc(currentUserId).set(userJson);
      ref
          .read(appRepositoryProvider.notifier)
          .setAppStatus(AppStatus.authenticatedWithUserData);
      ref
          .read(appRepositoryProvider.notifier)
          .setUserData(UserData.fromJson(userJson));
    } catch (e) {
      _setError(e.toString());
      print(e);
    }
  }

  /// returns true if there is no validation error
  bool _validationOnUsername() {
    if (state.username.isEmpty) {
      _setError('Enter your username');
      print('Enter your username');
      return false;
    }
    if (state.username.length < 3) {
      _setError('Username is too short');
      print('Username is too short');
      return false;
    }
    if (state.username.length > 14) {
      _setError('Your username should consist of 3-14 characters');
      print('Your username should consist of 3-14 characters');
      return false;
    }
    return true;
  }

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: CreateUsernameViewStatus.error,
      );
}

@freezed
class CreateUsernameViewState with _$CreateUsernameViewState {
  const factory CreateUsernameViewState({
    @Default('') String username,
    @Default(CreateUsernameViewStatus.initial) CreateUsernameViewStatus status,
    String? errorMessage,
  }) = _CreateUsernameViewState;
}

enum CreateUsernameViewStatus {
  initial,
  loading,
  error,
}
