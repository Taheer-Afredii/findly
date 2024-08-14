import 'package:flutter/material.dart';

class BottomshettViewmodel extends ChangeNotifier {
  int currentIndex = 0;

  onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool canPop = false;

  bool onPopScope(bool didPop) {
    if (didPop) {
      canPop = false;
      notifyListeners();
      return false;
    }
    if (currentIndex != 0) {
      currentIndex = 0;
      notifyListeners();
      canPop = false;
      return false;
    }
    canPop = true;
    notifyListeners();
    return true; // Indicate that the app should exit
  }
}
