import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/enums.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLBrandCard extends StatelessWidget {
  const SLBrandCard({
    super.key,
    required this.showBorder,
  });

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: SLRoundedContainer(
        padding: const EdgeInsets.all(SLSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: SLCircularImage(
                isNetworkImage: false,
                image: SLImages.slClothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark
                    ? SLColors.white
                    : SLColors.black,
              ),
            ),
            const SizedBox(width: SLSizes.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SLBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),

                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}