import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/features/personalization/controllers/user_controller.dart';
import 'package:genz_store/features/personalization/screens/profile/profile.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/shimmer/shimmer.dart';

class SLUserProfileTile extends StatelessWidget {
  const SLUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: const SLCircularImage(image: SLImages.user, width: 50, height: 50, padding: 0),
      title: Obx(() {
        if (controller.profileLoader.value) {
          return const SLShimmerEffect(width: 150, height: 15);
        } else {
          return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: SLColors.white));
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoader.value) {
          return const SLShimmerEffect(width: 80, height: 15);
        } else {
          return Text(controller.user.value.email, style: Theme.of(context,).textTheme.bodyMedium!.apply(color: SLColors.white));
        }
      }),
      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit, color: SLColors.white)),
    );
  }
}