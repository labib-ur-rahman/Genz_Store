import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/login_signup/form_divider.dart';
import 'package:genz_store/common/widgets/login_signup/social_buttons.dart';
import 'package:genz_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Title -----------------------------------------------------
              Text(SLTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Form ------------------------------------------------------
              SLSignupForm(),

              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Divider ---------------------------------------------------
              SLFormDivider(dividerText: SLTexts.orSignInWith.capitalize!),

              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Footer ----------------------------------------------------
              SLSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}