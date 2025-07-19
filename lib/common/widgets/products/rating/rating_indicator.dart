import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class SLRatingBarIndicator extends StatelessWidget {
  const SLRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: SLColors.grey,
      itemBuilder: (_, __) => const Icon (Iconsax.star1, color: SLColors.primary),
    );
  }
}