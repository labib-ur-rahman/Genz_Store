import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const SLProductQuantityWithAddAndRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SLCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: SLSizes.md,
          color: SLHelperFunctions.isDarkMode(context)
              ? SLColors.white
              : SLColors.black,
          backgroundColor: SLHelperFunctions.isDarkMode(context)
              ? SLColors.darkerGrey
              : SLColors.light,
        ),
        const SizedBox(width: SLSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: SLSizes.spaceBtwItems),
        const SLCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: SLSizes.md,
          color: SLColors.white,
          backgroundColor: SLColors.primary,
        ),
      ],
    );
  }
}
