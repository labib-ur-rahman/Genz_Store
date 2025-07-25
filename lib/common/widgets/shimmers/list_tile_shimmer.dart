import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class SLListTileShimmer extends StatelessWidget {
  const SLListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            SLShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: SLSizes.spaceBtwItems),
            Column(
              children: [
                SLShimmerEffect(width: 100, height: 15),
                SizedBox(height: SLSizes.spaceBtwItems / 2),
                SLShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
