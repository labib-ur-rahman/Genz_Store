import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/device/device_utility.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SLAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leading0nPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leading0nPressed;

  @override
  Widget build (BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SLSizes.md),
      child: AppBar (
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () => Get.back(), icon: Icon (Iconsax.arrow_left, color: dark ? SLColors.light : SLColors.dark))
            : leadingIcon != null? IconButton (onPressed: leading0nPressed, icon: Icon (leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SLDeviceUtils.getAppBarHeight());
}
