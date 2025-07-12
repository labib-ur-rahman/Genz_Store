import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class SLSocialButtons extends StatelessWidget {
  const SLSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SLColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: SLSizes.iconMd,
                height: SLSizes.iconMd,
                image: AssetImage(SLImages.google),
              )
          ),
        ),

        const SizedBox(width: SLSizes.spaceBtwItems),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SLColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: SLSizes.iconMd,
                height: SLSizes.iconMd,
                image: AssetImage(SLImages.facebook),
              )
          ),
        ),
      ],
    );
  }
}