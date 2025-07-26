import 'dart:convert';

import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../models/product_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
    final json = SLLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll (storedFavorites.map((key, value) => MapEntry (key, value as bool)));
    }
  }

  bool isFavourite (String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites [productId] = true;
      saveFavoritesToStorage();
      SLLoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      SLLocalStorage.instance().removeData(productId);
      favorites.remove (productId);
      saveFavoritesToStorage();
      favorites.refresh();
      SLLoaders.customToast(message: 'Product has been removed from the Wishlist.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    SLLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}