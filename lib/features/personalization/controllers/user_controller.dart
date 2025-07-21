import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials?.user != null) {
        final user = userCredentials!.user!;

        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(user.displayName ?? 'User');
        final username = UserModel.generateUsername(user.displayName ?? 'user_${user.uid.substring(0, 6)}');

      //if (userCredentials != null) {
        //final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '',);
        //final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '',);

        // Map Data
        final userModel = UserModel(
          id: user.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: user.email ?? '',
          phoneNumber: user.phoneNumber ?? '',
          profilePicture: user.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(userModel);

      }
    } catch (e) {
      SLLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }
}
