import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:genz_store/features/authentication/screens/login/login.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(SLSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Image with 60% of Screen Size
            Lottie.asset(
              SLImages.emailVerification,
              width: SLHelperFunctions.screenWidth(),
              repeat: true,
              animate: true,
            ),

            /// -- Title and SubTitle
            Text(
              email,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SLSizes.spaceBtwItems),
            Text(
              SLTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SLSizes.spaceBtwSections),

            /// -- Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                child: const Text(SLTexts.slDone),
              ),
            ),
            const SizedBox(height: SLSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text(SLTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
