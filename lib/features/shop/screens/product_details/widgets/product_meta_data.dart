import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/common/widgets/texts/product_price_text.dart';
import 'package:genz_store/common/widgets/texts/product_title_text.dart';
import 'package:genz_store/common/widgets/texts/sl_brand_title_text_with_verified_icon.dart';
import 'package:genz_store/features/shop/controllers/product/product_controller.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/enums.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLProductMetaData extends StatelessWidget {
  const SLProductMetaData({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(products.price, products.salePrice);
    final darkMode = SLHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            SLRoundedContainer(
              radius: SLSizes.sm,
              backgroundColor: SLColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: SLSizes.sm,
                vertical: SLSizes.xs,
              ),
              child: Text(
                '$salePercentage%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: SLColors.black),
              ),
            ),

            const SizedBox(width: SLSizes.spaceBtwItems),

            /// Price
            if(products.productType == ProductType.single.toString() && products.salePrice > 0)
              Text('\$${products.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if(products.productType == ProductType.single.toString() && products.salePrice > 0) const SizedBox(width: SLSizes.spaceBtwItems),
            SLProductPriceText(price: controller.getProductPrice(products), isLarge: true),
          ],
        ),

        const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

        /// Title
        SLProductTitleText(title: products.title),
        const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const SLProductTitleText(title: 'Status'),
            const SizedBox(width: SLSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(products.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: SLSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SLCircularImage(
              image: products.brand !=null ? products.brand!.image : '',
              width: 38,
              height: 38,
              isNetworkImage: true,
              backgroundColor: darkMode ? Colors.black : SLColors.white,
              overlayColor: darkMode ? SLColors.white : SLColors.black,
            ),
            SLBrandTitleWithVerifiedIcon(title: products.brand !=null ? products.brand!.name : '', brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
