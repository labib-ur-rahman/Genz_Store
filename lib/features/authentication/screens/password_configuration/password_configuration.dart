import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SLSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Heading
            Text(
              SLTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: SLSizes.spaceBtwItems),
            Text(
              SLTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: SLSizes.spaceBtwSections * 2),

            /// -- Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: SLTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: SLSizes.spaceBtwSections),

            /// -- Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => ResetPassword()),
                child: const Text(SLTexts.slSubmit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
