import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/features/shop/screens/order/widgets/orders_list.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
      appBar: SLAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),

      body: const Padding(
        padding: EdgeInsets.all(SLSizes.defaultSpace),

        /// Orders
        child: SLOrderListItems(),
      ), // Padding
    ); // Scaffold
  }
}
