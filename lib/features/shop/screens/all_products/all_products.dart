import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:genz_store/common/widgets/shimmers/vertical_product_shimmer_old.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: SLAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = SLVerticalProductShimmerX();
              final widget = SLCloudHelperFunctions.checkMultiRecordState (snapshot: snapshot, loader: loader);

              // Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // Products found!
              final products = snapshot.data!;

              return SLSortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
