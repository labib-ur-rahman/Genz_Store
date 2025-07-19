import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SLAppBar(title: Text('Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const SLRoundedImage(
                width: double.infinity,
                imageUrl: SLImages.promoBanner2,
                applyImageRadius: true,
              ),
              const SizedBox(height: SLSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  SLSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: SLSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SLSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const SLProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SLSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  SLSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: SLSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SLSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const SLProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
