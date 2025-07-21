import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../config/keys.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onBoarding/onboarding.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../navigation_menu.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(
            () => const LoginScreen(),
      ) // Redirect to Login Screen if not the first time
          : Get.offAll(
        const OnBoardingScreen(),
      ); // Redirect to OnBoarding Screen if it's the first time
    }
  }

  /* ------------------------- Email & Password sign-in ----------------------*/

  /// [EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password,) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SLFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password,) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SLFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] ReAuthenticate User

  /// [EmailVerification] MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SLFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SLFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /* ------------------- Federated identity & social sign-in -----------------*/

  /// [GoogleAuthentication] GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Initialize GoogleSignIn with web client ID
      final GoogleSignIn googleSignIn = kIsWeb ? GoogleSignIn(clientId: Keys.googleClientId, scopes: ['email', 'profile'],) : GoogleSignIn();

      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();
      //final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw SLFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  ///[FacebookAuthentication] FACEBOOK

  /* --------------- ./end Federated identity & social sign-in ---------------*/

  /// [LogoutUser] Valid for any authentication.
  Future<void> logout() async {
    try {
      // Initialize GoogleSignIn with same configuration
      final GoogleSignIn googleSignIn = kIsWeb ? GoogleSignIn(clientId: Keys.googleClientId) : GoogleSignIn();

      // Sign out from Google
      await googleSignIn.signOut();

      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Close any open dialogs
      if (Get.isDialogOpen!) Get.back();

      // Redirect to login screen
      Get.offAll(() => const LoginScreen());

      //await GoogleSignIn().signOut();
      //await FirebaseAuth.instance.signOut();
      //Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SLFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// DELETE USER Remove user Auth and Firestore Account.

}
