import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:genz_store/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);

  }

  /// Update Current Index and jump to next page
  void nextPage(){
    if(currentPageIndex.value == 2){
      final storage = GetStorage();

      if (kDebugMode) {
        print('===================== GET STORAGE Next Button - Before =======================');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);

      if (kDebugMode) {
        print('===================== GET STORAGE Next Button - After =======================');
        print(storage.read('IsFirstTime'));
      }

      Get.offAll(const LoginScreen());
    } else{
      currentPageIndex.value++;
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  /// Update Current Index and jump to last page
  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}