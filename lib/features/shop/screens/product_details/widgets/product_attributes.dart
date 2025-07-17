import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/chips/choice_chip.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLProductAttributes extends StatelessWidget {
  const SLProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        SLRoundedContainer(
          padding: const EdgeInsets.all(SLSizes.md),
          backgroundColor: dark ? SLColors.darkerGrey : SLColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const SLSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: SLSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SLProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: SLSizes.spaceBtwItems),

                          /// Sale Price
                          const SLProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const SLProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: SLSizes.spaceBtwItems / 2),

              /// Variation Description
              const SLProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: SLSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SLSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: SLSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SLChoiceChip(text: 'Green', selected: false, onSelected: (value) {},),
                SLChoiceChip(text: 'Blue', selected: true, onSelected: (value) {},),
                SLChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {},),
                SLChoiceChip(text: 'Purple', selected: false, onSelected: (value) {},),
                SLChoiceChip(text: 'Red', selected: false, onSelected: (value) {},),
                SLChoiceChip(text: 'Lime', selected: false, onSelected: (value) {},),
              ],
            ),
          ],
        ),
        const SizedBox(height: SLSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SLSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: SLSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SLChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {},),
                SLChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {},),
                SLChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
