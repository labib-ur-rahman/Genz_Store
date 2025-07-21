import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const SLAppBar(
        showBackArrow: true,
        title: Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SLSizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: SLValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: SLTexts.email,
                ),
              ),
              const SizedBox(height: SLSizes.spaceBtwInputFields),

              /// Password
              Obx(
                () => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) =>
                      SLValidator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                    labelText: SLTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: const Icon(Iconsax.eye_slash),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SLSizes.spaceBtwSections),

              /// LOGIN Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton (onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
