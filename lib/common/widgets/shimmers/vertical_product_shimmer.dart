import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/image_shimmer.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../styles/shadows.dart';
import '../layouts/grid_layout.dart';

class SLVerticalProductShimmer extends StatelessWidget {
  const SLVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Shimmer(
      gradient: LinearGradient(
        colors: [
          dark ? Colors.grey[850]! : Colors.grey[300]!,
          dark ? Colors.grey[700]! : Colors.grey[100]!,
          dark ? Colors.grey[850]! : Colors.grey[300]!,
        ],
        stops: const [0.1, 0.5, 0.9],
      ),
      child: SLGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => Container(
          padding: const EdgeInsets.all(SLSizes.sm),
          decoration: BoxDecoration(
            color: dark ? SLColors.darkerGrey : Colors.white,
            borderRadius: BorderRadius.circular(SLSizes.productImageRadius),
            boxShadow: [SLShadowStyle.verticalProductShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image Shimmer - Ensure it expands properly
              SizedBox(
                width: double.infinity,
                height: 150, // Fixed height for consistency
                child: const SLImageShimmerEffect(), // No size constraints here
              ),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Text Shimmer
              const SLShimmerEffect(width: 160, height: 15),
              const SizedBox(height: SLSizes.spaceBtwItems / 2),
              const SLShimmerEffect(width: 110, height: 15),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Price and Button Shimmer
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SLShimmerEffect(width: 60, height: 15),
                  SLShimmerEffect(width: 30, height: 30, radius: SLSizes.sm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}