import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MarketplaceSellitemViewmodel extends ChangeNotifier {
  List<String> sellItemPics = [];

  void setSellItemPic() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.length > 3) {
      Get.snackbar(
        'Images Limit Exceeded',
        'You can only select up to 3 images.Showing the first 3 images.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // Show a message to the user or handle the case where more than 3 images are selected
      print('You can only select up to 3 images.');
      // Optionally, you can take only the first 3 images
      sellItemPics = images.take(3).map((image) => image.path).toList();
    } else {
      sellItemPics = images.map((image) => image.path).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    sellItemPics.removeAt(index);
    notifyListeners();
  }

  void editImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      sellItemPics[index] = image.path;
      notifyListeners();
    }
  }
}
