import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/appbar/tabbar.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/controllers/category_controller.dart';
import 'package:genz_store/features/shop/screens/brand/all_brands.dart';
import 'package:genz_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);
    final categoriesController = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categoriesController.length,
      child: Scaffold(
        backgroundColor: dark ? SLColors.black : SLColors.white,
        appBar: SLAppBar(
          title: Text('Store', style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
          actions: [
            SLCartCounterIcon()
          ],
        ),

        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? SLColors.black : SLColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(SLSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [

                      /// Search bar
                      const SizedBox(height: SLSizes.spaceBtwItems),
                      const SLSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),

                      const SizedBox(height: SLSizes.spaceBtwSections),

                      /// Featured Brands
                      SLSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => AllBrandsScreen())),

                      const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

                      SLGridLayout(itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return SLBrandCard(showBorder: true);
                          })
                    ],
                  ),
                ),

                // TabBar
                bottom: SLTabBar(tabs: categoriesController.map((category) => Tab(text: category.name)).toList()),
              ),
            ];
          },

          /// -- Body of Tab Bar
          body: TabBarView(
              children: categoriesController.map((category) => SLCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}