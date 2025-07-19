import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';

class SLBillingAddressSection extends StatelessWidget {
  const SLBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SLSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),

        Text(SLTexts.authorName, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: SLSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: SLSizes.spaceBtwItems),
            Text(SLTexts.authorPhoneNo, style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: SLSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: SLSizes.spaceBtwItems),
            Expanded(
              child: Text(SLTexts.authorAddress, style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),
            ),
          ],
        ),
      ],
    );
  }
}
