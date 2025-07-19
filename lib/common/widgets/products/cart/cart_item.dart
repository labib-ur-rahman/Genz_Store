import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLCartItem extends StatelessWidget {
  const SLCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        SLRoundedImage(
          imageUrl: SLImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(SLSizes.sm),
          backgroundColor: SLHelperFunctions.isDarkMode(context) ? SLColors.darkerGrey : SLColors.light,
        ),
        const SizedBox (width: SLSizes.spaceBtwItems),

        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SLBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: SLProductTitleText(title: 'Black Sports shoes', maxLines: 1)),

              /// Attributes
              Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Color: ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green', style: Theme.of(context).textTheme.labelLarge),
                      TextSpan(text: '  ', style: Theme.of(context).textTheme.labelLarge),
                      TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 0B', style: Theme.of(context).textTheme.labelLarge),
                    ],
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}