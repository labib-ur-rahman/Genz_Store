import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

class SLSectionHeading extends StatelessWidget {
  const SLSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'View all',
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SLHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: (textColor == null)
                ? dark
                      ? SLColors.white
                      : SLColors.black
                : textColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
