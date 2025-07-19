import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLOrderListItems extends StatelessWidget {
  const SLOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: SLSizes.spaceBtwItems),
      itemBuilder: (_, index) => SLRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(SLSizes.md),
        backgroundColor: dark ? SLColors.dark : SLColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///--Row 1
            Row(
              children: [
                /// 1 Icon
                Icon(Iconsax.ship),
                SizedBox(width: SLSizes.spaceBtwItems / 2),
      
                /// 2 Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: SLColors.primary,
                          fontWeightDelta: 1,
                        ),
                      ),
      
                      Text(
                        '7 Nov 2024',
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                          fontWeightDelta: 1,
                        ),
                      ),
                    ],
                  ),
                ),
      
                /// 3 Icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.arrow_right_34, size: SLSizes.iconSm),
                ),
              ],
            ),
      
            const SizedBox(height: SLSizes.spaceBtwItems),
      
            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: SLSizes.spaceBtwItems / 2),
                  
                      /// 2 Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      /// 1 Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: SLSizes.spaceBtwItems / 2),
                  
                      /// 2 Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                            Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
