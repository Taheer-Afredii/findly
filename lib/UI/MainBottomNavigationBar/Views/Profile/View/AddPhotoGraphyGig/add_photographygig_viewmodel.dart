import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotographygigViewmodel extends ChangeNotifier {
  List<String> addPhotoGrapherPhotos = [];
  void setAddPhotoGrapherPhotos() async {
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
      addPhotoGrapherPhotos =
          images.take(10).map((image) => image.path).toList();
    } else {
      addPhotoGrapherPhotos = images.map((image) => image.path).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    addPhotoGrapherPhotos.removeAt(index);
    notifyListeners();
  }

  void editImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      addPhotoGrapherPhotos[index] = image.path;
      notifyListeners();
    }
  }
}
