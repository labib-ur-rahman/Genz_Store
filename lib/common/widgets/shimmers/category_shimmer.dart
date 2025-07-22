import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class SLCategoryShimmer extends StatelessWidget {
  const SLCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: SLSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SLShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: SLSizes.spaceBtwItems / 2),

              /// Text
              SLShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
