import 'package:flutter/material.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool isBookmarked = false;
  void changeBookmark() {
    isBookmarked = !isBookmarked;
    notifyListeners();
  }

  List<bool> isBookmarkedList = List.generate(5, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }
}
