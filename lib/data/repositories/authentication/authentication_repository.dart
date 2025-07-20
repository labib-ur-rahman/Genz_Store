import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onBoarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    if (kDebugMode) {
      print(
        '===================== GET STORAGE Auth Repo =======================',
      );
      print(deviceStorage.read('IsFirstTime'));
    }

    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  /* ------------------------- Email & Password sign-in ----------------------*/

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword (email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }

    // try {
    //   return await _auth.createUserWithEmailAndPassword (email: email, password: password);
    // } on FirebaseAuthException catch (e) {
    //   throw SLFirebaseAuthException(e.code).message;
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

  /// [ReAuthenticate] ReAuthenticate User

  /// [EmailVerification] MAIL VERIFICATION

  /// [EmailAuthentication] FORGET PASSWORD

  /* ------------------- Federated identity & social sign-in -----------------*/

  /// [GoogleAuthentication] GOOGLE

  ///[FacebookAuthentication] FACEBOOK

  /* --------------- ./end Federated identity & social sign-in ---------------*/

  /// [LogoutUser] Valid for any authentication.

  /// DELETE USER Remove user Auth and Firestore Account.
}
