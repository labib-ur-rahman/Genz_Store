import 'package:flutter/material.dart';
import 'package:genz_store/common/styles/shadows.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLProductCardVertical extends StatelessWidget {
  const SLProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SLShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SLSizes.productImageRadius),
          color: dark ? SLColors.darkerGrey : SLColors.white,
        ),

        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            SLRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(SLSizes.sm),
              backgroundColor: dark ? SLColors.dark : SLColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image -----------------------------------------
                  const SLRoundedImage(imageUrl: SLImages.circleAppLogo, applyImageRadius: true,),

                  /// -- Sale Tag ------------------------------------------------
                  Positioned(
                    top: 12,
                    child: SLRoundedContainer(
                      radius: SLSizes.sm,
                      backgroundColor: SLColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: SLSizes.sm, vertical: SLSizes.xs,),
                      child: Text('25%', style: Theme.of(context,).textTheme.labelLarge!.apply(color: SLColors.black),),
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

            const SizedBox(height: SLSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: SLSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SLProductTitleText(title: 'Green Nike Air Shoes', smallSize: true,),
                  const SizedBox(height: SLSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(width: SLSizes.xs),
                      const Icon(Iconsax.verify5, color: SLColors.primary, size: SLSizes.iconXs,),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      SLProductPriceText(price: '35.5', isLarge: true,),

                      Container(
                        decoration: const BoxDecoration(
                          color: SLColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              SLSizes.cardRadiusMd,
                            ),
                            bottomRight: Radius.circular(
                              SLSizes.productImageRadius,
                            ),
                          ),
                        ),

                        child: const SizedBox(
                          width: SLSizes.iconLg * 1.2,
                          height: SLSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: SLColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
