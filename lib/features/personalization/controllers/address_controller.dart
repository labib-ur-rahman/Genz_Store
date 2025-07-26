import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/address/address_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/manager/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();

      selectedAddress.value =
          addresses.firstWhere((element) => element.selectedAddress,
              orElse: () => AddressModel.empty());

      return addresses;
    } catch (e) {
      SLLoaders.errorSnackBar(
          title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Start the center circular loader
      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const SLCircularLoader(),
      );

      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      SLLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add new Address

  Future addNewAddresses() async {
    try {
      // Start Loading
      SLFullScreenLoader.openLoadingDialog('Storing Address...', SLImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SLFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        SLFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      // Update Selected Address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      SLFullScreenLoader.stopLoading();

      // Show Success Message
      SLLoaders.successSnackBar (title: 'Congratulations', message: 'Your address has been saved successfully.');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      SLFullScreenLoader.stopLoading();
      SLLoaders.errorSnackBar (title: 'Address not found', message: e.toString());
    }
  }

  /// -- Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

}