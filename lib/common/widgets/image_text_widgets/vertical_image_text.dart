import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLVerticalImageText extends StatelessWidget {
  const SLVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SLColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        //padding: const EdgeInsets.only(right: SLSizes.spaceBtwItems),
        padding: const EdgeInsets.only(right: SLSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(SLSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? SLColors.black : SLColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? SLColors.light : SLColors.dark,
                ),
              ),
            ),

            const SizedBox(height: SLSizes.spaceBtwItems / 2),

            /// Text
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context,).textTheme.labelMedium!.apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
