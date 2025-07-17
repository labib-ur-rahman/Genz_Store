import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/enums.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLProductMetaData extends StatelessWidget {
  const SLProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SLHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            SLRoundedContainer(
              radius: SLSizes.sm,
              backgroundColor: SLColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: SLSizes.sm,
                vertical: SLSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: SLColors.black),
              ),
            ),

            const SizedBox(width: SLSizes.spaceBtwItems),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: SLSizes.spaceBtwItems),
            const SLProductPriceText(price: '175', isLarge: true),
          ],
        ),

        const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

        /// Title
        const SLProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const SLProductTitleText(title: 'Status'),
            const SizedBox(width: SLSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SLCircularImage(
              image: SLImages.slDiamondIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? SLColors.white : SLColors.black,
            ),
            const SLBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
