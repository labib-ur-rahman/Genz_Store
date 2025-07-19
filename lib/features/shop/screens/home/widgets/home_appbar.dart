import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/text_strings.dart';

class SLHomeAppBar extends StatelessWidget {
  const SLHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SLAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SLTexts.homeAppbarTitle, style: Theme.of(context,).textTheme.labelMedium!.apply(color: SLColors.grey),),
          Text(SLTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: SLColors.white),),
        ],
      ),
      actions: [
        SLCartCounterIcon(iconColor: SLColors.white)
      ],
    );
  }
}