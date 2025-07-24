import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widgets.dart';
import 'package:genz_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:genz_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:genz_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:genz_store/features/shop/screens/product_details/widgets/rating_share_widgets.dart';
import 'package:genz_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:genz_store/utils/constants/enums.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SLBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            SLProductImageSlider(products: product),

            /// 2 - Product Details
            Padding(
              padding: EdgeInsets.only(
                right: SLSizes.defaultSpace,
                left: SLSizes.defaultSpace,
                bottom: SLSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// - Rating & Share
                  SLRatingAndShare(),

                  ///- Price, Title, Stock, & Brand
                  SLProductMetaData(products: product),
                  const SizedBox(height: SLSizes.spaceBtwItems),

                  /// -- Attributes
                  if(product.productType == ProductType.variable.toString()) SLProductAttributes(products: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox (height: SLSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton (onPressed: () {}, child: Text('Checkout'))),
                  const SizedBox (height: SLSizes.spaceBtwSections),

                  /// - Description
                  const SLSectionHeading (title: 'Description', showActionButton: false),
                  const SizedBox (height: SLSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText:' Show more',
                    textAlign: TextAlign.justify,
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox (height: SLSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Get.to(() => const ProductReviewsScreen()),
                          child: const SLSectionHeading (title: 'Reviews (199)', showActionButton: false)
                      ),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox (height: SLSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}