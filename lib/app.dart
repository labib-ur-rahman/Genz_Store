import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/screens/OnBoarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:genz_store/utils/theme/theme.dart';

/// -- Use this Class to setup themes, initial Bindings, any animations and much more using Material Widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SLAppTheme.lightTheme,
      darkTheme: SLAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}