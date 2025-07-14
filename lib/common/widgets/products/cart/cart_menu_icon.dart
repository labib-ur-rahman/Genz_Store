import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class SLCartCounterIcon extends StatelessWidget {
  const SLCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_bag, color: iconColor),),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: SLColors.black, borderRadius: BorderRadius.circular(100),),
            child: Center(child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: SLColors.white, fontSizeFactor: 0.8,),),
            ),
          ),
        ),
      ],
    );
  }
}
