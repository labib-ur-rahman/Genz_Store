import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class SLBoxesShimmer extends StatelessWidget {
  const SLBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: SLShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SLSizes.spaceBtwItems),
            Expanded(child: SLShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SLSizes.spaceBtwItems),
            Expanded(child: SLShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
