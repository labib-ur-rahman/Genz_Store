import 'package:flutter/material.dart';
import 'package:genz_store/features/personalization/controllers/user_controller.dart';
import 'package:genz_store/features/personalization/screens/profile/profile.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/manager/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

/// Controller to manage user-related functionality.
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// Update user name
  Future<void> updateUserName() async {
    try {
      // Start Loading
      SLFullScreenLoader.openLoadingDialog('We are updating your name...', SLImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {SLFullScreenLoader.stopLoading(); return;}

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        SLFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      SLFullScreenLoader.stopLoading();

      // Show Success Screen
      SLLoaders.successSnackBar (title: 'Congratulations', message: 'Your name has been updated.'.tr);

      // Redirect
      Get.to(() => ProfileScreen());
    } catch (e) {
      /// Remove Loader
      SLFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      SLLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}