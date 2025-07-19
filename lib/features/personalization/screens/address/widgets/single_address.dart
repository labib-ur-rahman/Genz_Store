import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SLSingleAddress extends StatelessWidget {
  const SLSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return SLRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(SLSizes.md),
      showBorder: true,
      backgroundColor: selectedAddress
          ? SLColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? SLColors.darkerGrey
          : SLColors.grey,
      margin: const EdgeInsets.only(bottom: SLSizes.spaceBtwItems),

      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                        ? SLColors.light
                        : SLColors.dark
                  : null,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SLTexts.authorName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: SLSizes.sm / 2),

              const Text(SLTexts.authorPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: SLSizes.sm / 2),
              const Text(SLTexts.authorFullAddress, softWrap: true,),
            ],
          ),
        ],
      ),
    );
  }
}
