import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/features/shop/models/brand_model.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLBrandShowcase extends StatelessWidget {
  const SLBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SLRoundedContainer(
      showBorder: true,
      borderColor: SLColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(SLSizes.md),
      margin: const EdgeInsets.only(bottom: SLSizes.spaceBtwItems),
      child: Column(
          children: [

            /// Brand with Products Count
            SLBrandCard(showBorder: false, brand: BrandModel.empty(),),

            const SizedBox(height: SLSizes.spaceBtwItems),

            /// Brand Top 3 Product Images
            Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
          ]
      ),

      // TRoundedContainer
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: SLRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(SLSizes.md),
      margin: const EdgeInsets.only(right: SLSizes.sm),
      backgroundColor: SLHelperFunctions.isDarkMode(context)
          ? SLColors.darkerGrey
          : SLColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
    );
  }
}