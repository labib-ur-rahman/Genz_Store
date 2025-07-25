import 'package:flutter/material.dart';
import 'package:genz_store/common/styles/spacing_styles.dart';
import 'package:genz_store/common/widgets/login_signup/form_divider.dart';
import 'package:genz_store/common/widgets/login_signup/social_buttons.dart';
import 'package:genz_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:genz_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SLSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// -- Logo, Title, SubTitle -------------------------------------
              SLLoginHeader(),

              /// -- Form ------------------------------------------------------
              SLLoginForm(),

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