import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';

class SLBrandsShimmer extends StatelessWidget {
  const SLBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build (BuildContext context) {
    return SLGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const SLShimmerEffect(width: 300, height: 80),

    );
  }
}