import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/enums.dart';

class SLProductCardHorizontal extends StatelessWidget {
  const SLProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice,);

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
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
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
                      '$salePercentage%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: SLColors.black),
                    ),
                  ),
                ),

                /// -- Favourite Icon Button
                Positioned(top: 0, right: 0, child: SLFavouriteIcon(productId: product.id),),
              ],
            ),
          ),

          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: SLSizes.sm, left: SLSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SLProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      SizedBox(height: SLSizes.spaceBtwItems / 2),
                      SLBrandTitleWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),

                  const Spacer(),

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
                                  product.price.toString(),
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
          ),
        ],
      ),
    );
  }
}
