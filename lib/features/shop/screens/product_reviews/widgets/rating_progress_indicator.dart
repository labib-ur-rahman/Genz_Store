import 'package:flutter/material.dart';
import 'package:genz_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class SLOverallProductRating extends StatelessWidget {
  const SLOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded (
          flex: 7,
          child: Column(
            children: [
              SLRatingProgressIndicator (text: '5', value: 1.0),
              SLRatingProgressIndicator (text: '4', value: 0.8),
              SLRatingProgressIndicator (text: '3', value: 0.6),
              SLRatingProgressIndicator (text: '2', value: 0.4),
              SLRatingProgressIndicator (text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}