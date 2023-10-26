import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../services/firebase_auth.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  late final StreamSubscription _subscription;

  AppRepository({
    required this.firebaseAuth,
  }) : super(const AppState()) {
    () async {
      await Future.delayed(const Duration(milliseconds: 2000));
      _subscription = firebaseAuth.authStateChanges().listen(
        (user) async {
          if (user == null) {
            state = state.copyWith(
              status: AppStatus.unauthenticated,
            );
          } else {
            // save user auth data in state
            state = state.copyWith(authUser: user);
            // fetch user's data from server & set state accordingly
            state = state.copyWith(
              status: AppStatus.authenticatedWithUserData,
            );
          }
        },
      );
    }();
  }

  // retryUserDataFetch() {
  //   _fetchUserDataAndSetState(state.authUser);
  // }

  // Future<ApiResponse> createUser({
  //   required String username,
  // }) async {
  //   // TODO: generate an avatar for the user, and upload it
  //   final response = await apiService.createUser(
  //     username: username,
  //     profilePicUrl: '',
  //     authToken: (await getIdToken()) ?? '',
  //     mobileNumber: state.authUser?.phoneNumber ?? '',
  //     fullName: '',
  //   );

  //   if (response.status == ApiStatus.success) {
  //     // update status of the user to authenticatedWithUserData
  //     state = state.copyWith(
  //       status: AppStatus.authenticatedWithUserData,
  //       // TODO: review and modify it
  //       userData: UserResponse(
  //         username: username,
  //         fullName: '',
  //         isSubscribed: false,
  //         profilePicUrl: '',
  //         fcmToken: null,
  //       ),
  //     );
  //   }
  //   return response;
  // }

  // Future<ApiResponse> deleteUser() async {
  //   final response = await apiService.deleteUser(
  //     authToken: await getIdToken() ?? '',
  //   );
  //   if (response.status == ApiStatus.success) {
  //     state = state.copyWith(
  //       status: AppStatus.unauthenticated,
  //     );
  //   }
  //   return response;
  // }

  // /// returns the idToken to be used for any 'private' API calls
  // /// if token gets expired, it refreshes the token and returns a new one
  // Future<String?> getIdToken({User? user}) async {
  //   final currentUser = user ?? firebaseAuth.currentUser;
  //   if (currentUser == null) return null;
  //   final idTokenResult = await currentUser.getIdTokenResult();
  //   // debugPrint(idTokenResult.toString());
  //   final String idToken;

  //   // check if token is null or is expired, then get the refreshed token
  //   if (idTokenResult.token == null ||
  //       (idTokenResult.expirationTime != null &&
  //           idTokenResult.expirationTime!.isBefore(DateTime.now()))) {
  //     debugPrint('token expired...refreshing token');
  //     // refresh the ID Token
  //     idToken = await currentUser.getIdToken(true);
  //   } else {
  //     // else, get the token from result
  //     idToken = idTokenResult.token!;
  //   }
  //   // debugPrint(idToken);
  //   return idToken;
  // }

  // void logout() {
  //   firebaseAuth.signOut();
  // }

  // /// fetches user data from server & sets the state
  // _fetchUserDataAndSetState(User? user) async {
  //   final idToken = await user?.getIdToken();
  //   debugPrint(idToken);

  //   if (idToken == null) {
  //     state = state.copyWith(
  //       status: AppStatus.unauthenticated,
  //     );
  //   } else {
  //     final response = await apiService.getUserData(
  //       authToken: await user?.getIdToken() ?? '',
  //     );
  //     if (response.status == ApiStatus.success) {
  //       state = state.copyWith(
  //         authUser: user,
  //         userData: response.data!,
  //         status: AppStatus.authenticatedWithUserData,
  //       );
  //       final fcmToken = await firebaseMessaging.getToken();
  //       debugPrint('fcmToken: $fcmToken');

  //       if (response.data!.fcmToken != fcmToken) {
  //         apiService.updateUserData(
  //           updateUserData: UpdateUserRequest(
  //             fcmToken: fcmToken,
  //           ),
  //           authToken: idToken,
  //         );
  //       }
  //     } else if (response.errorMessage == 'User not found!') {
  //       // user is authenticated, but user data is not present
  //       state = state.copyWith(
  //         authUser: user,
  //         status: AppStatus.authenticatedWithNoUserData,
  //       );
  //     } else if (response.errorMessage == noInternetErrorString) {
  //       // user is authenticated, but couldn't fetch user data as there's no internet connection
  //       state = state.copyWith(
  //         authUser: user,
  //         status: AppStatus.authenticatedButNoInternetConnection,
  //       );
  //     } else {
  //       // handle any other error here
  //       // TODO: handle error
  //       debugPrint('Error while fetching user data');
  //       debugPrint(response.toString());
  //     }
  //   }
  // }

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
    // @Default(null) UserResponse? userData,
    @Default(AppStatus.initial) AppStatus status,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  authenticatedWithNoUserData,
  authenticatedWithUserData,
}
