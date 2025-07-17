import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLBottomAddToCart extends StatelessWidget {
  const SLBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SLSizes.defaultSpace,
        vertical: SLSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? SLColors.darkerGrey : SLColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SLSizes.cardRadiusLg),
          topRight: Radius.circular(SLSizes.cardRadiusLg),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SLCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: SLColors.darkGrey,
                width: 40,
                height: 40,
                color: SLColors.white,
              ),
              const SizedBox(width: SLSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: SLSizes.spaceBtwItems),
              const SLCircularIcon(
                icon: Iconsax.add,
                backgroundColor: SLColors.black,
                width: 40,
                height: 40,
                color: SLColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(SLSizes.md),
              backgroundColor: SLColors.black,
              side: const BorderSide (color: SLColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
