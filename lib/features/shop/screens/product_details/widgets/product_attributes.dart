import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/chips/choice_chip.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../controllers/product/variation_controller.dart';

class SLProductAttributes extends StatelessWidget {
  const SLProductAttributes({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = SLHelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          /// -- Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            SLRoundedContainer(
              padding: const EdgeInsets.all(SLSizes.md),
              backgroundColor: dark ? SLColors.darkerGrey : SLColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title, Price and Stock Status
                  Row(
                    children: [
                      const SLSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(width: SLSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SLProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              /// Actual Price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              const SizedBox(width: SLSizes.spaceBtwItems),

                              /// Sale Price
                              SLProductPriceText(
                                price: controller.getVariationPrice(),
                              ),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const SLProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: SLSizes.spaceBtwItems / 2),

                  /// Variation Description
                  SLProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(height: SLSizes.spaceBtwItems),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: products.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SLSectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(height: SLSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(products.productVariations!, attribute.name!,)
                                .contains(attributeValue);

                            return SLChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(products, attribute.name ?? '', attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: SLSizes.spaceBtwItems),
                    ],
                  ),
                )
                .toList(),
          ),

        ],
      ),
    );
  }
}
