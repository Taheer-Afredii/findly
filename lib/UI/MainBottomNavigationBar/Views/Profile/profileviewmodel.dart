import 'package:flutter/material.dart';

import '../../../../Core/Custom/pick_image.dart';

class ProfileViewmodel extends ChangeNotifier {
  bool isCurrentPasswordVisible = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isWifiChecked = true;
  bool isTranportChecked = false;
  double rating = 4.8;
  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void toggleWifiChecked() {
    isWifiChecked = !isWifiChecked;
    notifyListeners();
  }

  void toggleTransportChecked() {
    isTranportChecked = !isTranportChecked;
    notifyListeners();
  }

  void setRating(double value) {
    rating = value;
    notifyListeners();
  }

  String? myProfilePic;
  void setMyProfilePic() {
    ImagePickerUtil.pickImage().then((String? value) {
      myProfilePic = value;
      notifyListeners();
    });
  }

  String? addPhotoGraphyGigPic;

  void setAddPhotoGraphyGigPic() {
    ImagePickerUtil.pickImage().then((String? value) {
      addPhotoGraphyGigPic = value;
      notifyListeners();
    });
  }
}
