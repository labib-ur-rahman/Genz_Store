import 'package:genz_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class DialogManager {


  /// -- Delete User Account Popup ---------------------------------------------
  static void deleteWarningPopup(
    String title,
    String message,
    VoidCallback onPressed,
  ) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(SLSizes.md),
      title: title,
      titlePadding: const EdgeInsets.only(top: SLSizes.lg),
      middleText: message,
      confirm: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red),),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: SLSizes.lg), child: Text(SLTexts.delete),),
      ),
      cancel: OutlinedButton(
        child: const Text(SLTexts.cancel),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

}
