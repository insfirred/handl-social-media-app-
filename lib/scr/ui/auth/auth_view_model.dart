import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/firebase_auth.dart';

part 'auth_view_model.freezed.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthViewState>(
  (ref) => AuthViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthViewState> {
  final FirebaseAuth firebaseAuth;

  AuthViewModel({
    required this.firebaseAuth,
  }) : super(const AuthViewState());

  // setMobileNumber(String mobile) => state = state.copyWith(
  //       mobile: mobile,
  //       status: AuthPageStatus.initial,
  //     );

  // setOtp(String otp) => state = state.copyWith(
  //       otp: otp,
  //       status: AuthPageStatus.initial,
  //     );

  setAuthPageScreen(AuthPageScreen screen) => state = state.copyWith(
        activeScreen: screen,
        status: AuthPageStatus.initial,
      );

  // /// returns whether back navigation should be triggered or not
  // bool onBackPressed() {
  //   if (state.activeScreen == AuthPageScreen.otpVerification) {
  //     state = state.copyWith(
  //       activeScreen:
  //           state.isLogin ? AuthPageScreen.login : AuthPageScreen.signup,
  //     );
  //     return false;
  //   }
  //   return true;
  // }

  // /// validates the phone number
  // /// makes an API call and check if this user exists or not
  // /// and requests OTP using Firebase Auth
  // requestOtp() async {
  //   if (state.mobile.trim().isEmpty) {
  //     _setError('Please enter the phone number.');
  //     return;
  //   }
  //   if (state.mobile.trim().length != 10) {
  //     _setError('Invalid phone number!');
  //     return;
  //   }
  //   final apiResponse =
  //       await apiService.checkIfUserExists('+91${state.mobile}');
  //   // if user is logging in, and account doesn't exist, show an error
  //   if (state.isLogin && apiResponse.status != ApiStatus.success) {
  //     _setError(
  //         'No account exists with this number! Please sign up to create an account.');
  //   }
  //   // if user is signing up, but account already exists, show an error
  //   else if (!state.isLogin && apiResponse.status == ApiStatus.success) {
  //     _setError('Account already exists! Please login in to continue.');
  //   }
  //   // else, request for OTP, and let the user continue
  //   else {
  //     state = state.copyWith(
  //       status: AuthPageStatus.processingRequestOtp,
  //     );
  //     _verifyPhoneNumber();
  //   }
  // }

  // /// requests resend OTP using Firebase Auth
  // resendOtp() async {
  //   state = state.copyWith(
  //     status: AuthPageStatus.processingResendOtp,
  //   );
  //   _verifyPhoneNumber(forceResend: true);
  // }

  // /// verifies the OTP when auto-verification doesn't work
  // /// and user manually enters the OTP
  // /// (validates OTP length before verification)
  // /// upon successful verification, signs in the user
  // verifyOtp() async {
  //   if (state.otp.isEmpty) {
  //     _setError('Please enter the OTP!');
  //     return;
  //   }
  //   if (state.otp.length != 6) {
  //     _setError('Invalid OTP entered.');
  //     return;
  //   }
  //   if (state.verificationId == null) {
  //     _setError('Please request the OTP again!');
  //     return;
  //   }
  //   state = state.copyWith(
  //     status: AuthPageStatus.processingVerifyOtp,
  //   );
  //   try {
  //     await firebaseAuth.signInWithCredential(
  //       PhoneAuthProvider.credential(
  //         verificationId: state.verificationId!,
  //         smsCode: state.otp,
  //       ),
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     _setError('Invalid OTP entered.');
  //   }
  // }

  // _setError(String? error) => state = state.copyWith(
  //       errorMessage: error,
  //       status: AuthPageStatus.error,
  //     );

  // /// calls verifyPhoneNumber in Firebase Auth to request or resend OTP
  // _verifyPhoneNumber({bool forceResend = false}) async {
  //   try {
  //     await firebaseAuth.verifyPhoneNumber(
  //       forceResendingToken: forceResend ? state.forceResendingToken : null,
  //       phoneNumber: '+91${state.mobile}',
  //       verificationCompleted: _onVerificationCompleted,
  //       verificationFailed: (FirebaseAuthException e) {
  //         debugPrint(e.message);
  //         _setError(e.message);
  //       },
  //       codeSent: (verificationId, forceResendingToken) {
  //         debugPrint('codeSent: $verificationId, $forceResendingToken');
  //         state = state.copyWith(
  //           verificationId: verificationId,
  //           forceResendingToken: forceResendingToken,
  //           activeScreen: AuthPageScreen.otpVerification,
  //           status: AuthPageStatus.initial,
  //         );
  //       },
  //       codeAutoRetrievalTimeout: (_) {
  //         debugPrint('codeAutoRetrievalTimeout: $_');
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     _setError(null);
  //   }
  // }

  // /// called when automatic OTP verification is completed
  // /// signs in the user using [credential]
  // _onVerificationCompleted(PhoneAuthCredential credential) async {
  //   try {
  //     await firebaseAuth.signInWithCredential(credential);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     _setError('Unable to sign in!');
  //   }
}

@freezed
class AuthViewState with _$AuthViewState {
  const factory AuthViewState({
    @Default('') String username,
    @Default('') String password,
    @Default(AuthPageStatus.initial) AuthPageStatus status,
    @Default(AuthPageScreen.login) AuthPageScreen activeScreen,
    String? errorMessage,
  }) = _AuthViewState;
}

enum AuthPageStatus {
  initial,
  loading,
  error,
}

enum AuthPageScreen {
  login,
  register,
}
