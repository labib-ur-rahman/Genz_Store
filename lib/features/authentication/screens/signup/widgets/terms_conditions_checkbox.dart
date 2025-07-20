import 'package:flutter/material.dart';
import 'package:genz_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SLTernsCondition extends StatelessWidget {
  const SLTernsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SLHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: SLSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${SLTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${SLTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? SLColors.white : SLColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? SLColors.white : SLColors.primary,
                ),
              ),
              TextSpan(
                text: '${SLTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${SLTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? SLColors.white : SLColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? SLColors.white : SLColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
