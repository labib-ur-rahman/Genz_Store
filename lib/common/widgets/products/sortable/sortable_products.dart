import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../features/shop/controllers/all_products_controller.dart';

class SLSortableProducts extends StatelessWidget {
  const SLSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: [SLTexts.qName, SLTexts.qHigherPrice, SLTexts.qLowerPrice, SLTexts.qSale, SLTexts.qNewest, SLTexts.qPopularity]
              .map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),

        const SizedBox(height: SLSizes.spaceBtwSections),

        /// Products
        Obx(() => SLGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => SLProductCardVertical(product: controller.products[index]))),
      ],
    );
  }
}