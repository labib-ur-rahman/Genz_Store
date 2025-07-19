import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:genz_store/features/shop/screens/checkout/checkout.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: Padding(
        padding: const EdgeInsets.all(SLSizes.defaultSpace),

        /// -- Item in Cart
        child: SLCartItems(),

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SLSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}