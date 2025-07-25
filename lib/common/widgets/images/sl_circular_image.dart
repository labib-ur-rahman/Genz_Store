import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';

class SLCircularImage extends StatelessWidget {
  const SLCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = SLSizes.sm,
    this.isNetworkImage = false,
    this.onPressed,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          // If image background color is null then switch it to light and dark mode color design.
          color: backgroundColor ?? (dark ? SLColors.black : SLColors.white),
          borderRadius: BorderRadius.circular(100),
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, downloadProgress) => SLShimmerEffect(width: 55, height: 55, radius: 55),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image(fit: fit, image: AssetImage(image), color: overlayColor),
          ),
        ),
      ),
    );
  }
}
