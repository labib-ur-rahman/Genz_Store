import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';
import 'package:genz_store/utils/constants/sizes.dart';

import '../layouts/grid_layout.dart';

class SLVerticalProductShimmerX extends StatelessWidget {
  const SLVerticalProductShimmerX({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SLGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox (
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            SLShimmerEffect (width: 180, height: 180),
            SizedBox(height: SLSizes.spaceBtwItems),

            /// Text
            SLShimmerEffect (width: 160, height: 15),
            SizedBox (height: SLSizes.spaceBtwItems / 2),
            SLShimmerEffect (width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}