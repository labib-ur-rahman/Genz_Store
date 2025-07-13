import 'package:flutter/material.dart';
import 'package:genz_store/common/styles/spacing_styles.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SLSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// -- Image
              Lottie.asset(
                image,
                width: SLHelperFunctions.screenWidth(),
                repeat: true,
                animate: true,
              ),

              SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Title and Subtitle

              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),

              const SizedBox (height: SLSizes.spaceBtwItems),

              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),

              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Buttons
              SizedBox(width: double.infinity, child: ElevatedButton (onPressed: onPressed, child: const Text (SLTexts.slContinue))),
            ],
          )
        )
      ),
    );
  }
}
