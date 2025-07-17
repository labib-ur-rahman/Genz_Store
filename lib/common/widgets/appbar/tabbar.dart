import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/device/device_utility.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs you have to wrap them in Material widget.
  /// To do that we need [PreferredSized] Widget and that's why created custom class. [PreferredSizeWidget]

  const SLTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? SLColors.black : SLColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: SLColors.primary,
        labelColor: dark ? SLColors.white : SLColors.primary,
        unselectedLabelColor: SLColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SLDeviceUtils.getAppBarHeight());
}