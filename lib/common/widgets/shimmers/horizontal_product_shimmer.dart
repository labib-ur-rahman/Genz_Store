import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';
import 'package:genz_store/utils/constants/sizes.dart';

import '../layouts/grid_layout.dart';

class SLHorizontalProductShimmer extends StatelessWidget {
  const SLHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SLSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: SLSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            SLShimmerEffect(width: 120, height: 120),
            SizedBox(width: SLSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SLSizes.spaceBtwItems / 2),
                SLShimmerEffect(width: 160, height: 15),
                SizedBox(height: SLSizes.spaceBtwItems / 2),
                SLShimmerEffect(width: 110, height: 15),
                SizedBox(height: SLSizes.spaceBtwItems / 2),
                SLShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
