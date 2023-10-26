import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media/scr/repositories/app_repository.dart';

import '../../services/firebase_auth.dart';

part 'auth_view_model.freezed.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthViewState>(
  (ref) => AuthViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    ref: ref,
  ),
);

class AuthViewModel extends StateNotifier<AuthViewState> {
  final FirebaseAuth firebaseAuth;
  final AutoDisposeStateNotifierProviderRef ref;

  AuthViewModel({
    required this.firebaseAuth,
    required this.ref,
  }) : super(const AuthViewState());

  setEmail(String email) => state = state.copyWith(
        email: email,
        status: AuthViewStatus.initial,
      );

  setPassword(String password) => state = state.copyWith(
        password: password,
        status: AuthViewStatus.initial,
      );
  setConfirmPassword(String password) => state = state.copyWith(
        confirmPassword: password,
        status: AuthViewStatus.initial,
      );

  setAuthPageScreen(AuthViewScreen screen) => state = state.copyWith(
        activeScreen: screen,
        status: AuthViewStatus.initial,
        password: '',
        email: '',
        confirmPassword: '',
      );

  setShowPassword(bool value) => state = state.copyWith(
        showPassword: value,
        status: AuthViewStatus.initial,
      );

  setShowConfirmPassword(bool value) => state = state.copyWith(
        showConfirmPassword: value,
        status: AuthViewStatus.initial,
      );

  setAuthViewStatus(AuthViewStatus status) =>
      state = state.copyWith(status: status);

  register() async {
    if (!_validationOnRegister()) return;
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      ref
          .read(appRepositoryProvider.notifier)
          .setAppStatus(AppStatus.authenticatedWithNoUserData);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _setError('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      _setError(e.toString());
      print(e);
    }
    print('No validation error, initiating registration!!!');
  }

  /// returns true if there is no validation error
  bool _validationOnRegister() {
    if (state.email.isEmpty) {
      _setError('Enter email');
      print('Enter email');
      return false;
    }
    // TODO: Email validation
    if (!EmailValidator.validate(state.email)) {
      _setError('Enter a valid email');
      print('Enter a valid email');
      return false;
    }
    if (state.password.isEmpty) {
      _setError('Enter password');
      print('Enter password');
      return false;
    }
    if (state.password.length < 6 || state.password.length > 14) {
      _setError('Enter a password of length of 4 - 16 characters.');
      print('Enter a password of length of 4 - 16 characters.');
      return false;
    }
    if (state.password != state.confirmPassword) {
      _setError('Confirm password doesn\'t matches');
      print('Confirm password doesn\'t matches');
      return false;
    }
    return true;
  }

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

  _setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: AuthViewStatus.error,
      );

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
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(AuthViewStatus.initial) AuthViewStatus status,
    @Default(AuthViewScreen.login) AuthViewScreen activeScreen,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword,
    String? errorMessage,
  }) = _AuthViewState;
}

enum AuthViewStatus {
  initial,
  loading,
  error,
}

enum AuthViewScreen {
  login,
  register,
}
