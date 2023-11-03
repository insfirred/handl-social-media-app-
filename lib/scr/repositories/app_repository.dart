import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/models/user_data.dart';

import '../services/cloud_firestore.dart';
import '../services/firebase_auth.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
      firebaseAuth: ref.watch(firebaseAuthProvider),
      firestore: ref.watch(firestoreProvider)),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  late final StreamSubscription _subscription;

  AppRepository({
    required this.firebaseAuth,
    required this.firestore,
  }) : super(const AppState()) {
    () async {
      await Future.delayed(const Duration(milliseconds: 2000));
      _subscription = firebaseAuth.authStateChanges().listen(
        (user) async {
          AppStatus currentStatus = AppStatus.initial;
          if (user == null) {
            currentStatus = AppStatus.unauthenticated;
          } else {
            // save user auth data in state
            state = state.copyWith(
              authUser: user,
              email: user.email,
            );
            // fetch user's data from server & set state accordingly
            currentStatus = await _fetchUserDataAndNavigate();
          }
          state = state.copyWith(status: currentStatus);
        },
      );
    }();
  }

  logout() {
    firebaseAuth.signOut();
  }

  setProfilePicUrlInFireStore(String url) async {
    try {
      final currentUserId = state.authUser!.uid;
      final userCollection = firestore.collection('users');
      await userCollection.doc(currentUserId).set(
        {'image_url': url},
        SetOptions(merge: true),
      );
      state = state.copyWith(
        userData: UserData(
          id: state.userData!.id,
          username: state.userData!.username,
          email: state.userData!.email,
          dateCreated: state.userData!.dateCreated,
          imageUrl: url,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  setAppStatus(AppStatus status) => state = state.copyWith(status: status);

  setUserData(UserData data) => state = state.copyWith(userData: data);

  Future<AppStatus> _fetchUserDataAndNavigate() async {
    AppStatus currentStatus = AppStatus.initial;
    final String currentUserId = state.authUser!.uid;
    print('current userId: $currentUserId');

    final CollectionReference<Map<String, dynamic>> usersCollection =
        firestore.collection('users');

    await usersCollection.doc(currentUserId).get().then(
      (json) {
        if (json.data() == null) {
          print("User data is not present");
          currentStatus = AppStatus.authenticatedWithNoUserData;
        } else {
          state = state.copyWith(userData: UserData.fromJson(json.data()!));
          currentStatus = AppStatus.authenticatedWithUserData;
        }
      },
    );
    return currentStatus;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    @Default(null) String? email,
    @Default(null) UserData? userData,
    @Default(AppStatus.initial) AppStatus status,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  authenticatedWithNoUserData,
  authenticatedWithUserData,
}
