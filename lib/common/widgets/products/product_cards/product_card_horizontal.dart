import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLProductCardHorizontal extends StatelessWidget {
  const SLProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SLSizes.productImageRadius),
        color: dark ? SLColors.darkerGrey : SLColors.softerGrey,
      ),

      // BoxDecoration
      child: Row(
        children: [
          /// Thumbnail
          SLRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(SLSizes.sm),
            backgroundColor: dark ? SLColors.dark : SLColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: SLRoundedImage(
                    imageUrl: SLImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag ------------------------------------------------
                Positioned(
                  top: 12,
                  child: SLRoundedContainer(
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
                ),

                /// -- Favourite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: SLCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: SLSizes.sm, left: SLSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SLProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: SLSizes.spaceBtwItems / 2),
                      SLBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: SLProductPriceText(price: '256.0')),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: SLColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SLSizes.cardRadiusMd),
                            bottomRight: Radius.circular(SLSizes.productImageRadius,),
                          ),
                        ),

                        child: const SizedBox(
                          width: SLSizes.iconLg * 1.2,
                          height: SLSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: SLColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
