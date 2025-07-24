import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../styles/shadows.dart';
import '../layouts/grid_layout.dart';

class SLVerticalProductShimmerOld extends StatelessWidget {
  const SLVerticalProductShimmerOld({super.key, this.itemCount = 4});

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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image Shimmer
              SLShimmerEffect(width: double.infinity, height: 120),
              SizedBox(height: SLSizes.spaceBtwItems),

              /// Text Shimmer
              SLShimmerEffect(width: 160, height: 15),
              SizedBox(height: SLSizes.spaceBtwItems / 2),
              SLShimmerEffect(width: 110, height: 15),
              SizedBox(height: SLSizes.spaceBtwItems),

              /// Price and Button Shimmer
              Row(
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