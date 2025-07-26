import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/features/personalization/controllers/address_controller.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: SLAppBar(
        showBackArrow: true,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                /// -- Name, Phone Number, Street, Postal Code, City, State, Country
                TextFormField(
                  controller: controller.name,
                  validator: (value) => SLValidator.validateEmptyText(SLTexts.name, value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: SLTexts.name,),
                ),
                const SizedBox(height: SLSizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.phoneNumber,
                  validator: SLValidator.validatePhoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: SLTexts.phoneNo),
                ),
                const SizedBox(height: SLSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => SLValidator.validateEmptyText(SLTexts.street, value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_44), labelText: SLTexts.street),
                      ),
                    ),
                    const SizedBox(width: SLSizes.spaceBtwInputFields),

                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => SLValidator.validateEmptyText(SLTexts.postalCode, value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: SLTexts.postalCode),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: SLSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => SLValidator.validateEmptyText(SLTexts.city, value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: SLTexts.city),
                      ),
                    ),
                    const SizedBox(width: SLSizes.spaceBtwInputFields),

                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => SLValidator.validateEmptyText(SLTexts.state, value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: SLTexts.state,),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: SLSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => SLValidator.validateEmptyText(SLTexts.country, value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: SLTexts.country),
                ),
                const SizedBox(height: SLSizes.defaultSpace),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.addNewAddresses,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
