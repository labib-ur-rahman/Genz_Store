import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/appbar/appbar.dart';
import 'package:genz_store/common/widgets/images/sl_circular_image.dart';
import 'package:genz_store/common/widgets/texts/section_heading.dart';
import 'package:genz_store/features/personalization/screens/profile/change_name.dart';
import 'package:genz_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:genz_store/utils/constants/image_strings.dart';
import 'package:genz_store/utils/constants/sizes.dart';
import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/manager/dialog_manager.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

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
                    TextButton(onPressed: () {}, child: const Text(SLTexts.changeProfilePic)),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: SLSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Heading Profile Info
              const SLSectionHeading(title: SLTexts.profileInfo, showActionButton: false,),
              const SizedBox(height: SLSizes.spaceBtwItems),

              SLProfileMenu(title: SLTexts.name, value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              SLProfileMenu(title: SLTexts.username, value: controller.user.value.username, onPressed: () {},),

              const SizedBox(height: SLSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: SLSizes.spaceBtwItems),

              /// Heading Personal Info
              const SLSectionHeading(title: SLTexts.personalInfo, showActionButton: false,),
              const SizedBox(height: SLSizes.spaceBtwItems),

              SLProfileMenu(title: SLTexts.userId, value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              SLProfileMenu(title: SLTexts.email, value: controller.user.value.email, onPressed: () {},),
              SLProfileMenu(title: SLTexts.phoneNo, value: controller.user.value.phoneNumber, onPressed: () {},),
              SLProfileMenu(title: SLTexts.gender, value: SLTexts.authorGender, onPressed: () {}),
              SLProfileMenu(title: SLTexts.dob, value: SLTexts.authorDOB, onPressed: () {},),

              const Divider(),
              const SizedBox (height: SLSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => DialogManager.deleteWarningPopup(
                      SLTexts.deleteAccount,
                      SLTexts.deleteAccountMessage,
                          () async => controller.deleteUserAccount()
                  ),
                  child: const Text(SLTexts.closeAccount, style: TextStyle (color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
