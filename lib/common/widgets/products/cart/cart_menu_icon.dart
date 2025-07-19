import 'package:flutter/material.dart';
import 'package:genz_store/features/shop/screens/cart/cart.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLCartCounterIcon extends StatelessWidget {
  const SLCartCounterIcon({super.key, this.iconColor, this.counterBgColor, this.counterTextColor});

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color : iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? SLColors.white : SLColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: counterTextColor ?? (dark ? SLColors.black : SLColors.white),
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
