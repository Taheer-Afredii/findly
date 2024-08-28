import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/Reviews/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String? accomodationPic;

  void setAccomodationPic() {
    ImagePickerUtil.pickImage().then((String? value) {
      accomodationPic = value;
      notifyListeners();
    });
  }

  String myReviewSelectedButton = "New";
  void setMyReviewSelectedButton(String value) {
    myReviewSelectedButton = value;
    notifyListeners();
  }

  //is review expended

  void toggleMyReviewExpend(int index) {
    myReviewList[index].isExpanded = !myReviewList[index].isExpanded;
    notifyListeners();
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("password");
    prefs.remove("isguest");
  }

  clearData() {
    myProfilePic = null;
    addPhotoGraphyGigPic = null;
    accomodationPic = null;

    notifyListeners();
  }
}
