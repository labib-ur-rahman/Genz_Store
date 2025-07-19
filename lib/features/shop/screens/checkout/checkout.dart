import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:genz_store/common/widgets/success_screen/success_screen.dart';
import 'package:genz_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:genz_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:genz_store/features/shop/screens/checkout/widgets/billing_amout_section.dart';
import 'package:genz_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:genz_store/navigation_menu.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: SLAppBar(
        showBackArrow: true,
        title: Text(
          SLTexts.orderReview,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const SLCartItems(showAddRemoveButton: false),
              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Coupon TextField
              SLCouponCode(),
              const SizedBox(height: SLSizes.spaceBtwSections),

              /// -- Billing Section
              SLRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(SLSizes.md),
                backgroundColor: dark ? SLColors.black : SLColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    SLBillingAmountSection(),
                    SizedBox(height: SLSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: SLSizes.spaceBtwItems),

                    /// Payment Methods www
                    SLBillingPaymentSection(),
                    SizedBox(height: SLSizes.spaceBtwItems),

                    /// Address
                    SLBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SLSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
