import 'package:flutter/material.dart';
import 'package:genz_store/common/styles/shadows.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/features/shop/screens/product_details/product_details.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/enums.dart';
import '../../images/sl_rounded_images_old.dart';
import '../favourite_icon/favourite_icon.dart';

class SLProductCardVertical extends StatelessWidget {
  const SLProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    final dark = SLHelperFunctions.isDarkMode(context);
    final price = product.price.toString();

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        //width: 180,
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
              //height: 180,
              padding: const EdgeInsets.all(SLSizes.sm),
              backgroundColor: dark ? SLColors.dark : SLColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image -----------------------------------------
                  // SLRoundedImage(
                  //   imageUrl: product.thumbnail,
                  //   applyImageRadius: true,
                  //   isNetworkImage: true,
                  // ),
                  SizedBox(
                    width: double.infinity,
                    height: 150, // Fixed height
                    child: SLRoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      fit: BoxFit.contain,
                    ),
                  ),

                  /// -- Sale Tag ------------------------------------------------
                  if (salePercentage != null)
                    Positioned(
                      top: SLSizes.xs + 2,
                      child: SLRoundedContainer(
                        radius: SLSizes.sm,
                        backgroundColor: SLColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: SLSizes.sm,
                          vertical: SLSizes.xs,
                        ),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: SLColors.black),
                        ),
                      ),
                    ),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SLFavouriteIcon(productId: product.id),
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
                  SLProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: SLSizes.spaceBtwItems / 2),
                  SLBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),

            // Todo: Add Spacer() here to keep the height of each Box same in case 1 or 2 lines Of Headings
            Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: SLSizes.zero),
                          child: Text(
                            '\$$price',
                            style: Theme.of(context).textTheme.labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: SLSizes.sm),
                        child: SLProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: const BoxDecoration(
                    color: SLColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SLSizes.cardRadiusMd),
                      bottomRight: Radius.circular(SLSizes.productImageRadius),
                    ),
                  ),

                  child: const SizedBox(
                    width: SLSizes.iconLg * 1.2,
                    height: SLSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: SLColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
