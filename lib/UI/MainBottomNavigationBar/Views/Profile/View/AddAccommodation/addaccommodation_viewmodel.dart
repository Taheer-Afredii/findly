import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddaccommodationViewmodel extends ChangeNotifier {
  List<String> addAccommodationPhotos = [];
  bool isWifiChecked = true;
  bool isTranportChecked = false;

  // void toggleWifiChecked() {
  //   isWifiChecked = !isWifiChecked;
  //   notifyListeners();
  // }

  // void toggleTransportChecked() {
  //   isTranportChecked = !isTranportChecked;
  //   notifyListeners();
  // }

  List<bool> amenitiesValues = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> amenitiesLabels = [
    "Wifi",
    "Transport",
    "Swimming pool",
    "Back-up power",
    "CCTV",
    "Parking",
    "Security",
    "Electric fence",
    "Entertainment area",
    "Furnished",
    "Washing machine",
    "Cleaning service",
    "Garden",
    "Air conditioning",
  ];

  void onAmenitiesChanged(int index, bool? value) {
    for (int i = 0; i < amenitiesValues.length; i++) {
      amenitiesValues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  void setAddAccommodationPhotos() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.length > 10) {
      Get.snackbar(
        'Images Limit Exceeded',
        'You can only select up to 10 images.Showing the first 10 images.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // Show a message to the user or handle the case where more than 3 images are selected
      print('You can only select up to 3 images.');
      // Optionally, you can take only the first 3 images
      addAccommodationPhotos =
          images.take(10).map((image) => image.path).toList();
    } else {
      addAccommodationPhotos = images.map((image) => image.path).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    addAccommodationPhotos.removeAt(index);
    notifyListeners();
  }

  void editImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      addAccommodationPhotos[index] = image.path;
      notifyListeners();
    }
  }
}
