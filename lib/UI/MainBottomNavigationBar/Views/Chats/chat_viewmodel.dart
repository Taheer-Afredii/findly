import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatViewmodel extends ChangeNotifier {
  TextEditingController sendMessageController = TextEditingController();
  bool isEmojiPickerVisible = false;
  final scrollController = ScrollController();

  void toggleEmojiPicker(context) {
    isEmojiPickerVisible = !isEmojiPickerVisible;
    if (isEmojiPickerVisible) {
      FocusScope.of(context).unfocus(); // Hide the keyboard
    } else {
      FocusScope.of(context).requestFocus(); // Show the keyboard
    }
    notifyListeners();
  }

  void onEmojiSelected(String emoji, context) {
    sendMessageController.text += emoji;
    toggleEmojiPicker(context);
  }

  void onTextFieldFocus() {
    isEmojiPickerVisible = false;
    notifyListeners();
  }

  String? attachment;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      attachment = file.name;
      notifyListeners();
      // Handle the selected file
      print('Picked file: ${file.name}');
    } else {
      // User canceled the picker
    }
  }

  Future<void> captureImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the captured image
      print('Captured image: ${image.path}');
    } else {
      // User canceled the camera
    }
  }
}
