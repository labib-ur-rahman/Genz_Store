import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/device/device_utility.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLSearchContainer extends StatelessWidget {
  const SLSearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showBorder = true, required this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SLSizes.defaultSpace),
        child: Container(
          width: SLDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SLSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ? SLColors.dark : SLColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(SLSizes.cardRadiusLg,),
            border: showBorder ? Border.all(color: SLColors.grey) : null,
          ),
          child: Row(
            children: [
              if (icon != null) Icon(icon, color: SLColors.darkerGrey),
              if (icon != null) const SizedBox(width: SLSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}