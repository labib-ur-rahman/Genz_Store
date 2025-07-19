import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLBillingPaymentSection extends StatelessWidget {
  const SLBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        SLSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: SLSizes.spaceBtwItems / 2),
        Row(
          children: [
            SLRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? SLColors.light : SLColors.white,
              padding: const EdgeInsets.all(SLSizes.sm),
              child: const Image(
                image: AssetImage(SLImages.paypal),
                fit: BoxFit.contain,
              ),
            ), // TRoundedContainer

            const SizedBox(width: SLSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.titleMedium),
          ],
        ), // Row
      ],
    ); // Column
  }
}