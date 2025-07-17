import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/success_screen/success_screen.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Image
              Lottie.asset(
                SLImages.emailVerification,
                width: SLHelperFunctions.screenWidth() * 1,
                repeat: true,
                animate: true,
              ),

              /// -- Title and Subtitle
              Text(
                SLTexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: SLSizes.spaceBtwItems),

              Text(
                SLTexts.authorEmail,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: SLSizes.spaceBtwItems),

              Text(
                SLTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                      image: SLImages.successfulCheck,
                      title: SLTexts.yourAccountCreatedTitle,
                      subTitle: SLTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                  ),),
                  child: const Text(SLTexts.slContinue),
                ),
              ),

              const SizedBox(height: SLSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(SLTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
