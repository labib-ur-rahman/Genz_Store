import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/screens/signup/verify_email.dart';
import 'package:genz_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLSignupForm extends StatelessWidget {
  const SLSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// -- First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: SLTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),

              const SizedBox(width: SLSizes.spaceBtwInputFields),

              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: SLTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Password
          TextFormField(
            obscureText: true,
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Terms & Conditions Checkbox -----------------------------------
          SLTernsCondition(),

          const SizedBox(height: SLSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(SLTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}