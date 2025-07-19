import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLCouponCode extends StatelessWidget {
  const SLCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);
    return SLRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? SLColors.dark : SLColors.white,
      padding: const EdgeInsets.only(
        top: SLSizes.sm,
        bottom: SLSizes.sm,
        right: SLSizes.sm,
        left: SLSizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? SLColors.white.withOpacity(0.5)
                    : SLColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}