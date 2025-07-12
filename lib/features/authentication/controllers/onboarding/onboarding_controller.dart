import 'package:flutter/cupertino.dart';
import 'package:genz_store/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';

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
      Get.offAll(LoginScreen());
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