import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SLSizes.defaultSpace),
      child: Column(
        children: [
          Lottie.asset(
            image,
            width: SLHelperFunctions.screenWidth() * 0.8,
            height: SLHelperFunctions.screenHeight() * 0.6,
            repeat: true,
            animate: true,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SLSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}