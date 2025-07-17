import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:genz_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:genz_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header ------------------------------------------------------
            SLPrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: SLSizes.xs),

                  /// -- Appbar ------------------------------------------------
                  SLHomeAppBar(),

                  const SizedBox(height: SLSizes.spaceBtwSections),

                  /// -- Searchbar ---------------------------------------------
                  SLSearchContainer(
                    text: SLTexts.searchHintText,
                    onTap: () {},
                  ),

                  const SizedBox(height: SLSizes.spaceBtwSections),

                  /// -- Categories --------------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(left: SLSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading Popular Categories ----------------------
                        SLSectionHeading(
                          title: SLTexts.popularCategories,
                          showActionButton: false,
                          textColor: SLColors.white,
                        ),

                        const SizedBox(height: SLSizes.spaceBtwItems),

                        /// -- Category List -----------------------------------
                        SLHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body --------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(SLSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider ------------------------------------------
                  SLPromoSlider(
                    banners: [
                      SLImages.promoBanner1,
                      SLImages.promoBanner2,
                      SLImages.promoBanner3,
                      SLImages.promoBanner4,
                      SLImages.promoBanner5,
                    ],
                  ),

                  const SizedBox(height: SLSizes.spaceBtwSections),

                  /// -- Heading Popular Categories ----------------------
                  SLSectionHeading(
                    title: SLTexts.popularProducts,
                    showActionButton: true,
                    onPressed: () {},
                  ),

                  const SizedBox(height: SLSizes.spaceBtwItems),

                  /// -- Popular Products --------------------------------------
                  SLGridLayout(itemCount: 10, itemBuilder: (_, index) => const SLProductCardVertical(),)
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
