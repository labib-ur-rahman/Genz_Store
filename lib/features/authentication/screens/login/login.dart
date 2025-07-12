import 'package:flutter/material.dart';
import 'package:genz_store/common/styles/spacing_styles.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SLSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// -- Logo, Title, SubTitle -------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 90,
                    image: AssetImage(
                      dark ? SLImages.lightAppLogo : SLImages.darkAppLogo,
                    ),
                  ),
                  const SizedBox(height: SLSizes.lg),
                  Text(
                    SLTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: SLSizes.sm),
                  Text(
                    SLTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              /// -- Form ------------------------------------------------------
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: SLSizes.spaceBtwSections,
                  ),
                  child: Column(
                    children: [
                      /// -- Email
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: SLTexts.email,
                        ),
                      ),

                      const SizedBox(height: SLSizes.spaceBtwInputFields),

                      /// -- Password
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: SLTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),

                      const SizedBox(height: SLSizes.spaceBtwInputFields / 2),

                      /// -- Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Remember Me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(SLTexts.rememberMe),
                            ],
                          ),

                          /// Forgot Password
                          TextButton(
                            onPressed: () {},
                            child: const Text(SLTexts.forgetPassword),
                          ),
                        ],
                      ),

                      const SizedBox(height: SLSizes.spaceBtwInputFields),

                      /// -- Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(SLTexts.signIn),
                        ),
                      ),

                      const SizedBox(height: SLSizes.spaceBtwItems),

                      /// -- Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(SLTexts.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// -- Divider ---------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? SLColors.darkGrey : SLColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    SLTexts.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? SLColors.darkGrey : SLColors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),

              /// -- Footer ----------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: dark ? SLColors.darkGrey : SLColors.grey,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      // child: ImageButton(
                      //   onPressed: () {},
                      //
                      //
                      // ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
