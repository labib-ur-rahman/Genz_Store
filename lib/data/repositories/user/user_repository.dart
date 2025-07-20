import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user/user_model.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }

    // try {
    //   await _db.collection("Users").doc(user.id).set(user.toJson());
    // } on FirebaseException catch (e) {
    //   throw SLFirebaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const SLFormatException();
    // } on PlatformException catch (e) {
    //   throw SLPlatformException(e.code).message;
    // } catch (e) {
    //   throw 'Something went wrong. Please try again';
    // }
  }

  /// Function to fetch user details based on user ID.

  /// Function to update user data in Firestore.

  /// Update any field in specific Users Collection
}