import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/graduationphotography_home.dart';
import 'package:flutter/material.dart';

class PhotographyHomeviewmodel extends ChangeNotifier {
  String search = '';

  void setSearch(String value) {
    search = value;
    notifyListeners();
  }

  clearSearch() {
    search = '';
    notifyListeners();
  }

  List<bool> isBookmarkedList =
      List.generate(topRatedPhotographer.length, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }

  List<bool> isBookmarkedResultList =
      List.generate(topRatedPhotographerresult.length, (index) => false);

  void toggleResultBookmark(int index) {
    isBookmarkedResultList[index] = !isBookmarkedResultList[index];
    notifyListeners();
  }
}
