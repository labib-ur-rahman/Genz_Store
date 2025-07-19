import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:genz_store/common/widgets/products/cart/cart_item.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class SLCartItems extends StatelessWidget {
  const SLCartItems({
    super.key, this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
      const SizedBox(height: SLSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          SLCartItem(),
          if(showAddRemoveButton) const SizedBox(height: SLSizes.spaceBtwItems),

          if(showAddRemoveButton) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  const SizedBox(width: 70),

                  /// Add Remove Buttons
                  SLProductQuantityWithAddAndRemoveButton(),
                ],
              ),

              /// -- Product total extra
              SLProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}