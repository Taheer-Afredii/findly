import 'package:flutter/material.dart';

import '../../../../../../Models/accommodation_model.dart';

class AccomodationViewmodel extends ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;

  void setSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  List<bool> isBookmarkedList =
      List.generate(accomodationList.length, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }
}
