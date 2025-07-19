import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/features/personalization/screens/address/add_new_address.dart';
import 'package:genz_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: SLColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: SLColors.white),
      ),

      appBar: SLAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            children: [
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: true),
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: false),
              SLSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
