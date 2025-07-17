import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class SLUserProfileTile extends StatelessWidget {
  const SLUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: const SLCircularImage(
      //   image: SLImages.user,
      //   width: 50,
      //   height: 50,
      //   padding: 0,
      // ),

      leading: CircleAvatar(
        radius: 25, // Matches your original 50x50 dimensions (radius = diameter/2)
        backgroundColor: Colors.transparent, // Optional: remove background color
        backgroundImage: AssetImage(SLImages.user), // Use AssetImage for local assets
      ),

      title: Text(
        'Labib UR Rahman',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: SLColors.white),
      ),

      subtitle: Text(
        'contact.labibur@gmail.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: SLColors.white),
      ),

      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: SLColors.white),
      ),
    );
  }
}