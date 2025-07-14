import 'package:flutter/material.dart';
import 'package:genz_store/features/shop/screens/home/home.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavigationController());
    final darkMode = SLHelperFunctions.isDarkMode (context);

    return Scaffold(
        bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            backgroundColor: darkMode ? SLColors.black: Colors.white,
            indicatorColor: darkMode ? SLColors.white.withOpacity(0.1): SLColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon (Iconsax.home), label: 'Home'),
              NavigationDestination (icon: Icon (Iconsax.shop), label: 'Store'),
              NavigationDestination (icon: Icon (Iconsax.heart), label: 'Wishlist'),
              NavigationDestination (icon: Icon (Iconsax.user), label: 'Profile'),
            ],
          ),
        ),
        body: Obx(() => controller.screens [controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(), Container(color: Colors.green), Container(color: Colors.blue), Container(color: Colors.yellow,)];

  // final List<Widget> screens = [
  //   HomeScreen(),
  //   Container(color: Colors.green),
  //   Container(color: Colors.blue),
  //   Container(color: Colors.yellow),
  // ];
}