import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:genz_store/utils/constants/image_strings.dart';

class SLHomeCategories extends StatelessWidget {
  const SLHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return SLVerticalImageText(
            image: SLImages.slDiamondIcon,
            title: 'Diamond',
            onTap: () {},
          );
        },
      ),
    );
  }
}