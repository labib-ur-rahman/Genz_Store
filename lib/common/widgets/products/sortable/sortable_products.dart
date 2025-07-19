import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/layouts/grid_layout.dart';
import 'package:genz_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SLSortableProducts extends StatelessWidget {
  const SLSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort),),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity',]
              .map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),

        const SizedBox(height: SLSizes.spaceBtwSections),

        /// Products
        SLGridLayout(itemCount: 8, itemBuilder: (_, index) => const SLProductCardVertical(),),
      ],
    );
  }
}