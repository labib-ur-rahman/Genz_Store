import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/brands/brands_show_case.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/models/category_model.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class SLCategoryTab extends StatelessWidget {
  const SLCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Brands
              const SLBrandShowcase(
                images: [
                  SLImages.productImage1,
                  SLImages.productImage2,
                  SLImages.productImage1,
                ],
              ),
              const SizedBox(height: SLSizes.spaceBtwItems),

              ///Products
              SLSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: SLSizes.spaceBtwItems),

              SLGridLayout(itemCount: 10, itemBuilder: (_, index) => const SLProductCardVertical(),),

              const SizedBox(height: SLSizes.spaceBtwSections),
            ],
          ), // Column
        ),
      ],
    );
  }
}
