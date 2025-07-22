import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:genz_store/features/personalization/controllers/user_controller.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/common/widgets/shimmers/shimmer.dart';
import 'package:get/get.dart';

class SLHomeAppBar extends StatelessWidget {
  const SLHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return SLAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SLTexts.homeAppbarTitle,
            style: Theme.of(context,).textTheme.labelMedium!.apply(color: SLColors.grey),
          ),
          Obx(() {
            if (controller.profileLoader.value) {
              return const SLShimmerEffect(width: 150, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context,).textTheme.headlineSmall!.apply(color: SLColors.white),);
            }
          }),
        ],
      ),
      actions: [SLCartCounterIcon(iconColor: SLColors.white)],
    );
  }
}
