import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/enums.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SLBrandTitleWithVerifiedIcon extends StatelessWidget {
  const SLBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = SLColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SLBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),

        const SizedBox(width: SLSizes.xs),

        Icon(Iconsax.verify5, color: iconColor, size: SLSizes.iconXs),
      ],
    );
  }
}