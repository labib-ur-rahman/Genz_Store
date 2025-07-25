import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/features/shop/models/brand_model.dart';
import 'package:genz_store/features/shop/screens/all_products/brand_products.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../shimmers/shimmer.dart';

class SLBrandShowcase extends StatelessWidget {
  const SLBrandShowcase({
    super.key,
    required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: SLRoundedContainer(
        showBorder: true,
        borderColor: SLColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(SLSizes.md),
        margin: const EdgeInsets.only(bottom: SLSizes.spaceBtwItems),
        child: Column(
            children: [

              /// Brand with Products Count
              SLBrandCard(showBorder: false, brand: brand),

              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Brand Top 3 Product Images
              Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
            ]
        ),

        // TRoundedContainer
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: SLRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(SLSizes.md),
      margin: const EdgeInsets.only(right: SLSizes.sm),
      backgroundColor: SLHelperFunctions.isDarkMode(context)
          ? SLColors.darkerGrey
          : SLColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const SLShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
    ));
  }
}