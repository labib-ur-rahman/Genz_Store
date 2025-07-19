import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/common/widgets/products/rating/rating_indicator.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(SLImages.user)),
                const SizedBox(width: SLSizes.spaceBtwItems),
                Text(
                  SLTexts.authorName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: SLSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const SLRatingBarIndicator(rating: 4.5),
            const SizedBox(width: SLSizes.spaceBtwItems),
            Text('01 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SLSizes.spaceBtwItems),

        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SLColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SLColors.primary),
        ),
        const SizedBox(height: SLSizes.spaceBtwItems),

        /// Company Review
        SLRoundedContainer(
          backgroundColor: dark ? SLColors.darkerGrey : SLColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(SLSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("GenZ Store", style: Theme.of(context).textTheme.titleMedium,),
                    Text('02 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: SLSizes.spaceBtwItems),

                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SLColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SLColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: SLSizes.spaceBtwSections),
      ],
    );
  }
}
