import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLShimmerEffect extends StatelessWidget {
  const SLShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? (dark ? SLColors.darkerGrey : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}