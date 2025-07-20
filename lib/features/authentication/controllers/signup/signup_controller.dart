import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/loaders/loaders.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/manager/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../models/user/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// -- Variables -------------------------------------------------------------
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = false.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP ----------------------------------------------------------------

  void signup() async {
    try {
      /// Start Loading
      SLFullScreenLoader.openLoadingDialog('We are processing your information...', SLImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// Remove Loader
        SLFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if(!signupFormKey.currentState!.validate()) {
        /// Remove Loader
        SLFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy Check
      if (!privacyPolicy.value) {
        /// Remove Loader
        SLFullScreenLoader.stopLoading();
        SLLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      /// Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Remove Loader
      SLFullScreenLoader.stopLoading();

      /// Show Success Message
      SLLoaders.successSnackBar (title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      /// Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      /// Remove Loader
      SLFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      SLLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
