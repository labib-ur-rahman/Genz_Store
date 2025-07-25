import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:genz_store/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../../models/brand_model.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: SLAppBar(title: Text(brand.name)),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Brand Detail
              SLBrandCard(showBorder: true, brand: brand),
              SizedBox(height: SLSizes.spaceBtwSections),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  /// Handle Loader, No Record, OR Error Message
                  const loader = SLVerticalProductShimmer();

                  final widget = SLCloudHelperFunctions.checkMultiRecordState (snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  /// Record Found!
                  final brandProducts = snapshot.data!;
                  return SLSortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
