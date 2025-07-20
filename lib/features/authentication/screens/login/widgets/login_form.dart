import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/screens/password_configuration/password_configuration.dart';
import 'package:genz_store/features/authentication/screens/signup/signup.dart';
import 'package:genz_store/navigation_menu.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/login/login_controller.dart';

class SLLoginForm extends StatelessWidget {
  const SLLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SLSizes.spaceBtwSections),
        child: Column(
          children: [
            /// -- Email
            TextFormField(
              controller: controller.email,
              validator: (value) => SLValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: SLTexts.email,
              ),
            ),

            const SizedBox(height: SLSizes.spaceBtwInputFields),

            /// -- Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    SLValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                  labelText: SLTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
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
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                        ),
                      ),
                    ),
                    const SizedBox(width: SLSizes.sm),
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
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(SLTexts.signIn),
              ),
            ),

            const SizedBox(height: SLSizes.spaceBtwItems),

            /// -- Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(SLTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
