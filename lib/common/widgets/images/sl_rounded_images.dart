import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/sizes.dart';

import '../shimmers/image_shimmer.dart';

class SLRoundedImage extends StatelessWidget {
  const SLRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageUrl,
    this.fit = BoxFit.cover, // Changed to cover for better filling
    this.backgroundColor,
    this.isNetworkImage = false,
    this.borderRadius = SLSizes.md,
    this.showShimmer = true, // Add this to control shimmer visibility
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool showShimmer; // New parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: _buildImage(context),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    // Show shimmer if needed
    if (showShimmer && imageUrl.isEmpty) {
      return SLImageShimmerEffect(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        radius: borderRadius,
      );
    }

    // Show placeholder if image is empty
    if (imageUrl.isEmpty) {
      return _buildPlaceholder();
    }

    // Load network image
    if (isNetworkImage) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        placeholder: (context, url) => SLImageShimmerEffect(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          radius: borderRadius,
        ),
        errorWidget: (context, url, error) => _buildPlaceholder(),
      );
    }
    // Load asset image
    else {
      return Image.asset(
        imageUrl,
        fit: fit,
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey[400],
          size: 24,
        ),
      ),
    );
  }
}