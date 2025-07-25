import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a background color.
  ///
  /// Properties are:
  /// Container [width], [height], & [backgroundColor].
  ///
  /// Icon's [size], [color] & [onPressed]

  const SLCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = SLSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : SLHelperFunctions.isDarkMode(context)
            ? SLColors.black.withOpacity(0.9)
            : SLColors.white.withOpacity(0.9),

        borderRadius: BorderRadius.circular(100),
      ), // BoxDecoration

      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    ); // Container
  }
}
