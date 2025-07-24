import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:genz_store/bindings/general_bindings.dart';
import 'package:genz_store/routes/app_routes.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:genz_store/utils/theme/theme.dart';



/// -- Use this Class to setup themes, initial Bindings, any animations and much more using Material Widget.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async{
    //print("Pausing...");
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 3));
    //print("Unpausing");
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.system,
      theme: SLAppTheme.lightTheme,
      darkTheme: SLAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: SLColors.primary, body: Center (child: CircularProgressIndicator (color: Colors.white))),

      ///-- Permanent Route
      //home: const OnBoardingScreen(),

      ///-- Temporary Route
      // home: const AllBrandsScreen(),
    );
  }
}