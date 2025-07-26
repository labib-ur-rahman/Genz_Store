import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/features/personalization/screens/address/add_new_address.dart';
import 'package:genz_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/address_controller.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

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

          child: Obx(
              () => FutureBuilder(
              // Use key to trigger refresh data
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                /// Helper Function: Handle Loader, No Record, OR ERROR Message
                final response = SLCloudHelperFunctions.checkMultiRecordState (snapshot: snapshot);
                if (response != null) return response;
                final addresses = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) => SLSingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses [index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
