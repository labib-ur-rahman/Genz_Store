import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/screens/password_configuration/password_configuration.dart';
import 'package:genz_store/features/authentication/screens/signup/signup.dart';
import 'package:genz_store/navigation_menu.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLLoginForm extends StatelessWidget {
  const SLLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
                    const Text(SLTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(SLTexts.forgetPassword),
                ),
              ],
            ),

            const SizedBox(height: SLSizes.spaceBtwInputFields),

            /// -- Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(SLTexts.signIn),
              ),
            ),

            const SizedBox(height: SLSizes.spaceBtwItems),

            /// -- Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: ()  => Get.to(() => const SignupScreen()),
                child: const Text(SLTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}