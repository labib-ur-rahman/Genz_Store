import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/icons/sl_circular_icon.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/features/shop/screens/home/home.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer_old.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/product/favourite_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

    return Scaffold(
      appBar: SLAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        actions: [
          SLCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),

          /// Products Grid
          child: Obx(
              () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                /// Nothing Found Widget
                final emptyWidget = SLAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: SLImages.emptyBoxAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );

                const loader = SLVerticalProductShimmerX(itemCount: 6);

                final widget = SLCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptyWidget,
                );

                if (widget != null) return widget;

                final products = snapshot.data!;

                return SLGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) =>
                      SLProductCardVertical(product: products[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
