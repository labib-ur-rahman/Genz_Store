import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:genz_store/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';

/// -- Entry Point of the GenZ Store Application
Future<void> main() async {
  /// -- Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Splash until other items Load
  FlutterNativeSplash.preserve (widgetsBinding: widgetsBinding);

  /// -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp (options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo: Init Payment Methods
  // Todo: Initialize Firebase
  // Todo: Initialize Firebase Authentication

  /// -- Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => App(), // Wrap your app
  //   ),
  // );
}