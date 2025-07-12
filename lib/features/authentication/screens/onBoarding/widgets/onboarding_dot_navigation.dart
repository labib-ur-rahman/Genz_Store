import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/device/device_utility.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final dark = SLHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: SLDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SLSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? SLColors.light : SLColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
