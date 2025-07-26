import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/controllers/category_controller.dart';
import 'package:genz_store/features/shop/models/category_model.dart';
import 'package:genz_store/features/shop/screens/all_products/all_products.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/images/sl_rounded_images_old.dart';
import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: SLAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              if(category.banner != '')
                SLRoundedImageX(width: double.infinity, imageUrl: category.banner, applyImageRadius: true, isNetworkImage: true,),
              if(category.banner != '') const SizedBox(height: SLSizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  /// Handle Loader, No Record, OR Error Message
                  const loader = SLHorizontalProductShimmer();
                  final widget = SLCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found.
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {

                      final subCategory = subCategories[index];

                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {

                          /// Handle Loader, No Record, OR Error Message
                          final widget = SLCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          /// Record found.
                          final products = snapshot.data!;

                          return Column(
                            children: [
                              /// Heading
                              SLSectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(
                                      () => AllProductsScreen (
                                    title: subCategory.name,
                                    futureMethod: controller.getCategoryProducts (categoryId: subCategory.id, limit: -1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: SLSizes.spaceBtwItems / 2),

                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => const SizedBox(width: SLSizes.spaceBtwItems),
                                  itemBuilder: (context, index) => SLProductCardHorizontal(product: products[index]),
                                ),
                              ),

                              const SizedBox(height: SLSizes.spaceBtwSections),
                            ],
                          );
                        }
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
