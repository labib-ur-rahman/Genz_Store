import 'package:flutter/material.dart';
import 'package:genz_store/rendom_dummy_products.dart';
import 'package:genz_store/utils/constants/sizes.dart';

import 'firestore_dummy_data.dart';


class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(padding: EdgeInsets.only(left: SLSizes.md, right: SLSizes.md)),
            //   onPressed: () async {
            //     await addRandomDummyProducts();
            //   },
            //   child: const Text('Add Dummy Products'),
            // ),

            SizedBox(height: SLSizes.md),

            OutlinedButton(
              style: OutlinedButton.styleFrom(padding: EdgeInsets.only(left: SLSizes.md, right: SLSizes.md)),
              onPressed: () async {
                await singleDummyProductUpdate();
              },
              child: const Text('Single Dummy Product Update'),
            )
          ],
        ),
      ),
    );
  }
}