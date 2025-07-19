import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/products/rating/rating_indicator.dart';
import 'package:genz_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:genz_store/features/shop/screens/product_reviews/widgets/user_rating_card.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: const SLAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and are from people who use the same type of device that you use.",),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Overall Product Ratings
              SLOverallProductRating(),
              SLRatingBarIndicator(rating: 3.7),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox (height: SLSizes.spaceBtwSections),

              /// User Reviews List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard()


            ],
          ),
        ),
      ),
    );
  }
}