import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';

class SLLoginHeader extends StatelessWidget {
  const SLLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 90,
          image: AssetImage(
            dark ? SLImages.lightAppLogo : SLImages.darkAppLogo,
          ),
        ),
        const SizedBox(height: SLSizes.lg),
        Text(
          SLTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: SLSizes.sm),
        Text(
          SLTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}