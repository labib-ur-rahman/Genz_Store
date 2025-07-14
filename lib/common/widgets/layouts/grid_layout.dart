import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class SLGridLayout extends StatelessWidget {
  const SLGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: SLSizes.gridViewSpacing,
        crossAxisSpacing: SLSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
