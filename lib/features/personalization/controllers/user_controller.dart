import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/manager/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/models/user/user_model.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/profile/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoader = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoader.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoader.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      /// First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      /// If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final user = userCredentials.user!;

          /// Convert Name to First and Last Name
          final nameParts = UserModel.nameParts(user.displayName ?? '');
          final username = UserModel.generateUsername(
            user.displayName ?? 'sl_${user.uid.substring(0, 6)}',
          );

          /// Map Data
          final userModel = UserModel(
            id: user.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: user.email ?? '',
            phoneNumber: user.phoneNumber ?? '',
            profilePicture: user.photoURL ?? '',
          );

          /// Save user data
          await userRepository.saveUserRecord(userModel);
        }
      }
    } catch (e) {
      SLLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Delete User Account
  /*void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(SLSizes.md),
      title: 'Delete Account',
      titlePadding: const EdgeInsets.only(top: SLSizes.lg),
      middleText:
      'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: SLSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }*/

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      SLFullScreenLoader.openLoadingDialog(
        'Processing',
        SLImages.docerAnimation,
      );

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData
          .map((e) => e.providerId)
          .first;

      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          SLFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          SLFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      SLFullScreenLoader.stopLoading();
      SLLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      SLFullScreenLoader.openLoadingDialog(
        'Processing',
        SLImages.docerAnimation,
      );

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SLFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        SLFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();
      SLFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      SLFullScreenLoader.stopLoading();
      SLLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80, maxHeight: 512, maxWidth: 512,);
      if (image != null) {
        imageUploading.value = true;

        // Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image,);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        SLLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      SLLoaders.errorSnackBar(title: 'OhSnap', message: 'Something went wrong: $e',);
    } finally {
      imageUploading.value = false;
    }
  }
}
