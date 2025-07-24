import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:genz_store/common/widgets/images/sl_rounded_images.dart';
import 'package:genz_store/features/shop/controllers/banner_controller.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/shimmers/shimmer.dart';

class SLPromoSlider extends StatelessWidget {
  const SLPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      // Loader
      if (controller.isLoading.value) {
        return const SLShimmerEffect(width: double.infinity, height: 190);
      }

      // No data found
      if (controller.allBanners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 18 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
                scrollDirection: Axis.horizontal,
              ),
              items: controller.allBanners
                  .map(
                    (banner) => SLRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
            ), //

            const SizedBox(height: SLSizes.spaceBtwItems),

            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.allBanners.length; i++)
                      SLCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                            ? SLColors.primary
                            : SLColors.grey,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
