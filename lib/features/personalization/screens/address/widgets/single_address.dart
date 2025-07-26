import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/features/personalization/controllers/address_controller.dart';
import 'package:genz_store/features/personalization/models/address_model.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLSingleAddress extends StatelessWidget {
  const SLSingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = SLHelperFunctions.isDarkMode(context);

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;

        return GestureDetector(
          onTap: onTap,
          child: SLRoundedContainer(
            width: double.infinity,
            padding: const EdgeInsets.all(SLSizes.md),
            showBorder: true,
            backgroundColor: selectedAddress
                ? SLColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : dark
                ? SLColors.darkerGrey
                : SLColors.grey,
            margin: const EdgeInsets.only(bottom: SLSizes.spaceBtwItems),

            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress
                        ? dark
                        ? SLColors.light
                        : SLColors.dark
                        : null,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: SLSizes.sm / 2),

                    Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: SLSizes.sm / 2),
                    Text(address.toString(), softWrap: true,),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
