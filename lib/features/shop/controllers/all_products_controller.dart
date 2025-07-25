import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:genz_store/common/widgets/loaders/loaders.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = SLTexts.qName.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if(query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      SLLoaders.errorSnackBar (title: 'Oh Snap!', message: e.toString());

      return [];
    }
  }

  void sortProducts (String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case SLTexts.qName :
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SLTexts.qHigherPrice :
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SLTexts.qLowerPrice :
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SLTexts.qNewest :
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
    // case SLTexts.qPopularity :
    //   products.sort((a, b) => b.rating!.compareTo(a.rating!));
    //   break;
      case SLTexts.qSale :
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
      // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts (List<ProductModel> products) {
    // Assign products to the 'products' list
    this.products.assignAll(products);
    sortProducts(SLTexts.qName);
  }
}