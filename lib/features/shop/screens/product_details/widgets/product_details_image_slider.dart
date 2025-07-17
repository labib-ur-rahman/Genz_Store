import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLProductImageSlider extends StatelessWidget {
  const SLProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return SLCurvedEdgeWidget(
      child: Container(
        color: dark ? SLColors.darkerGrey : SLColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(SLSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(SLImages.productImage2),
                ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SLSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated (
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox (width: SLSizes.spaceBtwItems),
                  itemBuilder: (_, index) => SLRoundedImage(
                    width: 80,
                    backgroundColor: dark? SLColors.dark: SLColors.white,
                    border: Border.all(color: SLColors.primary),
                    padding: const EdgeInsets.all(SLSizes.sm),
                    imageUrl: SLImages.productImage1,
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            SLAppBar (
              showBackArrow: true,
              actions: [SLCircularIcon (icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
