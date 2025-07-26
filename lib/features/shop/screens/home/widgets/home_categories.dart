import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:genz_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../controllers/category_controller.dart';

class SLHomeCategories extends StatelessWidget {
  const SLHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if(categoryController.isLoading.value) return const SLCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center (child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return SLVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
