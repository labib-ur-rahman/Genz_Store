import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/brands/brand_card.dart';
import 'package:genz_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SLAppBar(title: Text('Nike')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Brand Detail
              SLBrandCard(showBorder: true),
              SizedBox(height: SLSizes.spaceBtwSections),
              SLSortableProducts(products: [],),
            ],
          ),
        ),
      ),
    );
  }
}
