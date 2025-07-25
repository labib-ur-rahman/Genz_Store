import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/brands/brands_show_case.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/controllers/category_controller.dart';
import 'package:genz_store/features/shop/models/category_model.dart';
import 'package:genz_store/features/shop/screens/all_products/all_products.dart';
import 'package:genz_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../models/product_model.dart';

class SLCategoryTab extends StatelessWidget {
  const SLCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(height: SLSizes.spaceBtwItems),

              ///Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  /// Helper Function: Handle Loader, No Record, OR ERROR Message
                  final response = SLCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const SLVerticalProductShimmer(),
                  );
                  if (response != null) return response;

                  /// Record Found!
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      SLSectionHeading(
                        title: SLTexts.youMightLike,
                        onPressed: () => Get.to(
                          AllProductsScreen(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                              categoryId: category.id,
                              limit: -1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: SLSizes.spaceBtwItems),

                      SLGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) =>
                            SLProductCardVertical(product: products[index]),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: SLSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
