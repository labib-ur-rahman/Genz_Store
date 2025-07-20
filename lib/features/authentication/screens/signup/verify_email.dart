import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/success_screen/success_screen.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../controllers/signup/verify_email_controller.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      /// The close icon in the app bar is used to log out the user and redirect them to the login screen.
      /// This approach is taken to handle scenarios where the user enters the registration process,
      /// and the data is stored. Upon reopening the app, it checks if the email is verified.
      /// If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => AuthenticationRepository.instance.logout()),
            icon: const Icon(CupertinoIcons.clear),
          ),
          const SizedBox(width: SLSizes.md),
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
                email ?? '',
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
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(SLTexts.slContinue),
                ),
              ),

              const SizedBox(height: SLSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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
