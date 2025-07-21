import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/manager/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  /// -- Variables -------------------------------------------------------------
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text =
        localStorage.read('REMEMBER_ME_EMAIL') ?? ''; // Handle null case
    password.text =
        localStorage.read('REMEMBER_ME_PASSWORD') ?? ''; // Handle null case
    rememberMe.value =
        localStorage.read('REMEMBER_ME_CHECKBOX') ?? false; // Handle null case
    super.onInit();
  }

  /// -- LOGIN ----------------------------------------------------------------
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Start Loading
      SLFullScreenLoader.openLoadingDialog(
          'Logging you in...', SLImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// Remove Loader
        SLFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        /// Remove Loader
        SLFullScreenLoader.stopLoading();
        return;
      }

      /// Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
        localStorage.write('REMEMBER_ME_CHECKBOX', rememberMe.value);
      } else {
        // Clear credentials when not remembering
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
        localStorage.remove('REMEMBER_ME_CHECKBOX');
      }

      /// Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader
      SLFullScreenLoader.stopLoading();

      /// Redirect to Home Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      /// Remove Loader
      SLFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      SLLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication ------------------------------------------

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      SLFullScreenLoader.openLoadingDialog('Logging you in...', SLImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        SLFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      if (userCredentials == null) {
        SLFullScreenLoader.stopLoading();
        SLLoaders.errorSnackBar(title: 'Error', message: 'Google sign-in failed');
        return;
      }

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      SLFullScreenLoader.stopLoading();

      // Redirect to Home Screen
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Remove Loader
      SLFullScreenLoader.stopLoading();
      SLLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}