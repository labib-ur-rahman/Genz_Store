import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';

/*Future<void> main() async {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Init Payment Methods
  // Todo: Await Native Splash Screen
  // Todo: Initialize Firebase

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //   (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );
  // Todo: Initialize Firebase Authentication

  runApp(const App());
}

void main(){
  runApp(const App());
}*/

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => App(), // Wrap your app
    ),
  );
}