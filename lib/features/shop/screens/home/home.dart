import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:genz_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

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
                    icon: Iconsax.search_normal,
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

                        SLHomeCategories(),
                      ],
                    ),
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
