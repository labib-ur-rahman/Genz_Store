import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBar(
        showBackArrow: true,
        title: Text('Add new Address', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: SLSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
                const SizedBox(height: SLSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_44), labelText: 'Street'))),
                    const SizedBox(width: SLSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code')))
                  ],
                ),

                const SizedBox(height: SLSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
                    const SizedBox(width: SLSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),
                  ],
                ),

                const SizedBox(height: SLSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                const SizedBox(height: SLSizes.defaultSpace),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}