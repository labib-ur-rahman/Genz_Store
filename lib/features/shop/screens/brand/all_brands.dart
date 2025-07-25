import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/controllers/brand_controller.dart';
import 'package:genz_store/features/shop/models/brand_model.dart';
import 'package:genz_store/features/shop/screens/all_products/brand_products.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../utils/constants/text_strings.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const SLAppBar(title: Text(SLTexts.brand), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Heading
              const SLSectionHeading(
                title: SLTexts.brands,
                showActionButton: false,
              ),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const SLBrandsShimmer();
                }

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      SLTexts.noDataFound,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: Colors.white),
                    ),
                  );
                }

                return SLGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = brandController.allBrands[index];
                    return SLBrandCard(
                      showBorder: true,
                      brand: brand,
                      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
