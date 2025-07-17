import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/appbar/tabbar.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    final tabs = [
      Tab(child: Text('Sports')),
      Tab(child: Text('Furniture')),
      Tab(child: Text('Electronics')),
      Tab(child: Text('Clothes')),
      Tab(child: Text('Cosmetics')),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: dark ? SLColors.black : SLColors.white,
        appBar: SLAppBar(
          title: Text('Store', style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
          actions: [
            SLCartCounterIcon(onPressed: () {})
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
                      SLSectionHeading(
                        title: 'Featured Brands', onPressed: () {},),

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
                bottom: SLTabBar(tabs: tabs),
              ),
            ];
          },

          /// -- Body of Tab Bar
          body: TabBarView(
              children: [
                SLCategoryTab(),
                SLCategoryTab(),
                SLCategoryTab(),
                SLCategoryTab(),
                SLCategoryTab(),
              ]
          ),
        ),
      ),
    );
  }
}