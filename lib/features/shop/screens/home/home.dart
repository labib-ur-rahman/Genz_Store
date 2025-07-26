import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/screens/all_products/all_products.dart';
import 'package:genz_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:genz_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:genz_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer_old.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header ------------------------------------------------------
            SLPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// -- Appbar ------------------------------------------------
                  SLHomeAppBar(),

                  const SizedBox(height: SLSizes.spaceBtwSections),

                  /// -- Searchbar ---------------------------------------------
                  SLSearchContainer(
                    text: SLTexts.searchHintText,
                    onTap: () {},
                  ),

                  const SizedBox(height: SLSizes.spaceBtwSections),

                  /// -- Categories --------------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(left: SLSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading Popular Categories ----------------------
                        SLSectionHeading(
                          title: SLTexts.popularCategories,
                          showActionButton: false,
                          textColor: SLColors.white,
                        ),

                        const SizedBox(height: SLSizes.spaceBtwItems),

                        /// -- Category List -----------------------------------
                        SLHomeCategories(),
                      ],
                    ),
                  ),

                  const SizedBox(height: SLSizes.spaceMaxBelow),
                ],
              ),
            ),

            /// -- Body --------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(SLSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider ------------------------------------------
                  SLPromoSlider(),

                  const SizedBox(height: SLSizes.spaceBtwSections),

                  /// -- Heading Popular Categories ----------------------
                  SLSectionHeading(
                    title: SLTexts.popularProducts,
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllProductsScreen(
                      title: SLTexts.popularProducts,
                      futureMethod: controller.fetchAllFeaturedProducts(),
                    )),
                  ),

                  const SizedBox(height: SLSizes.spaceBtwItems),

                  /// -- Popular Products --------------------------------------
                  Obx(() {
                    if (controller.isLoading.value) return const SLVerticalProductShimmerX();
                    if (controller.featuredProducts.isEmpty) {
                      return Center (child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return SLGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => SLProductCardVertical (product: controller.featuredProducts[index]),
                    );
                  })
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}