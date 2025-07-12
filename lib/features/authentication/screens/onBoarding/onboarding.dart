import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:genz_store/features/authentication/screens/OnBoarding/widgets/onboarding_next.dart';
import 'package:genz_store/features/authentication/screens/OnBoarding/widgets/onboarding_page.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                title: SLTexts.onBoardingTitle1,
                subTitle: SLTexts.onBoardingSubTitle1,
                image: SLImages.onBoardingAnimations1,
              ),
              OnBoardingPage(
                title: SLTexts.onBoardingTitle2,
                subTitle: SLTexts.onBoardingSubTitle2,
                image: SLImages.onBoardingAnimations2,
              ),
              OnBoardingPage(
                title: SLTexts.onBoardingTitle3,
                subTitle: SLTexts.onBoardingSubTitle3,
                image: SLImages.onBoardingAnimations3,
              ),
            ],
          ),

          /// Skip Button
          OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          /// Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}