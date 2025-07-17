import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SLAppBar(showBackArrow: true, title: Text('Profile')),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SLSizes.defaultSpace),

          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,

                child: Column(
                  children: [
                    const SLCircularImage(image: SLImages.user, width: 80, height: 80,),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: SLSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Heading Profile Info
              const SLSectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: SLSizes.spaceBtwItems),

              SLProfileMenu(title: 'Name', value: SLTexts.authorName, onPressed: () {},),
              SLProfileMenu(title: 'Username', value: SLTexts.authorUsername, onPressed: () {},),

              const SizedBox(height: SLSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Heading Personal Info
              const SLSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: SLSizes.spaceBtwItems),

              SLProfileMenu(title: 'User ID', value: SLTexts.authorFevNo, icon: Iconsax.copy, onPressed: () {}),
              SLProfileMenu(title: 'E-mail', value: SLTexts.authorEmail, onPressed: () {},),
              SLProfileMenu(title: 'Phone Number', value: SLTexts.authorPhoneNo, onPressed: () {},),
              SLProfileMenu(title: 'Gender', value: SLTexts.authorGender, onPressed: () {}),
              SLProfileMenu(title: 'Date of Birth', value: SLTexts.authorDOB, onPressed: () {},),

              const Divider(),
              const SizedBox (height: SLSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account', style: TextStyle (color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
