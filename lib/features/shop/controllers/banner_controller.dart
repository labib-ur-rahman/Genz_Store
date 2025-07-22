import 'package:genz_store/data/repositories/banners/banner_repository.dart';
import 'package:genz_store/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Indicator
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners by Position
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading banners
      isLoading.value = true;

      // Fetch banners from data source (Firestore, API, etc.)
      final banners = await _bannerRepository.fetchBanners();

      // Sort banners by position in ascending order
      banners.sort((a, b) => a.position.compareTo(b.position));

      // Update the banners list
      allBanners.assignAll(banners);
    } catch (e) {
      SLLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// Fetch Banners Without Sorting
  Future<void> fetchBannersWithoutSorting() async {
    try {
      // Show loader while loading banners
      isLoading.value = true;

      // Fetch banners from data source (Firestore, API, etc.)
      final banners = await _bannerRepository.fetchBanners();

      // Update the banners list
      allBanners.assignAll(banners);

    } catch (e) {
      SLLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }

}
