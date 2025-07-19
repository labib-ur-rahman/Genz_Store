import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/screens/all_products/brand_products.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SLAppBar(title: Text('Brand'), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Heading
              const SLSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Brands
              SLGridLayout(
                itemCount: 9,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => SLBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProductsScreen()),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
