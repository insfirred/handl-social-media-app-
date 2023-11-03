import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../repositories/app_repository.dart';
import '../../services/firebase_storage.dart';

part 'profile_view_model.freezed.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileViewState>(
  (ref) => ProfileViewModel(
    firebaseStorage: ref.watch(firebaseStorageProvider),
    ref: ref,
  ),
);

class ProfileViewModel extends StateNotifier<ProfileViewState> {
  final FirebaseStorage firebaseStorage;
  final StateNotifierProviderRef ref;

  ProfileViewModel({
    required this.firebaseStorage,
    required this.ref,
  }) : super(const ProfileViewState());

  pickImageAndUpload() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final Reference storageReference = firebaseStorage.ref().child(
            'images/${ref.read(appRepositoryProvider).authUser!.uid}/pp',
          );
      UploadTask? uploadTask = storageReference.putFile(File(image.path));

      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final String url = await snapshot.ref.getDownloadURL();
      state = state.copyWith(url: url);
      ref.read(appRepositoryProvider.notifier).setProfilePicUrlInFireStore(url);
    } else {
      print('No Image selected');
    }
  }
}

@freezed
class ProfileViewState with _$ProfileViewState {
  const factory ProfileViewState({
    String? url,
  }) = _ProfileViewState;
}
