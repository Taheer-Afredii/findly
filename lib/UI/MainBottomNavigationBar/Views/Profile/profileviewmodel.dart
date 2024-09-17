import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/Reviews/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Core/Custom/pick_image.dart';

class ProfileViewmodel extends ChangeNotifier {
  bool isWifiChecked = true;
  bool isTranportChecked = false;

  double rating = 4.8;

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
    prefs.remove("email");
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
