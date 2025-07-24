import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

class SLSignupForm extends StatelessWidget {
  const SLSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// -- First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => SLValidator.validateEmptyText(SLTexts.firstName, value),
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
                  controller: controller.lastName,
                  validator: (value) => SLValidator.validateEmptyText(SLTexts.lastName, value),
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
            controller: controller.username,
            validator: (value) => SLValidator.validateUsername(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Email
          TextFormField(
            controller: controller.email,
            validator: (value) => SLValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => SLValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: SLTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => SLValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration: InputDecoration(
                labelText: SLTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton (
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(height: SLSizes.spaceBtwInputFields),

          /// -- Terms & Conditions Checkbox -----------------------------------
          SLTernsCondition(),

          const SizedBox(height: SLSizes.spaceBtwSections),

          /// Sign Up Button ---------------------------------------------------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(SLTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}