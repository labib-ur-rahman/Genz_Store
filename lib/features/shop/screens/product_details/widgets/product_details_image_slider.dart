import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images_old.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../controllers/product/images_controller.dart';

class SLProductImageSlider extends StatelessWidget {
  const SLProductImageSlider({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(products);

    return SLCurvedEdgeWidget(
      child: Container(
        color: dark ? SLColors.darkerGrey : SLColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(SLSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final thumbnail = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(thumbnail),
                      child: CachedNetworkImage(
                        imageUrl: thumbnail,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: SLColors.primary,
                            ),
                      ),
                    );
                  }),
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
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(right: SLSizes.md),
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: SLSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(
                    (){
                      final isSelected = controller.selectedProductImage.value == images[index];
                      return SLRoundedImageX(
                        width: 80,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        onPressed: () => controller.selectedProductImage.value = images[index],
                        padding: const EdgeInsets.all(SLSizes.sm),
                        backgroundColor: dark ? SLColors.dark : SLColors.white,
                        border: Border.all(color: isSelected ? SLColors.primary : Colors.transparent),
                      );
                    }
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            SLAppBar(
              showBackArrow: true,
              actions: [
                SLCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
