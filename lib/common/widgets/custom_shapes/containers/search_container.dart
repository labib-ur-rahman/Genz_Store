import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/device/device_utility.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLSearchContainer extends StatelessWidget {
  const SLSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: SLSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;  // Noted
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SLDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SLSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ? SLColors.dark : SLColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(SLSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: SLColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: SLColors.darkerGrey),
              const SizedBox(width: SLSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
