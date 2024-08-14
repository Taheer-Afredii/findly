import 'package:findly/Models/ammenities_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../Models/accommodation_model.dart';

class AccomodationViewmodel extends ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;

  void setSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  void onCategoryChanged(int index) {
    for (int i = 0; i < categories.length; i++) {
      categories[i].isSelected = i == index;
    }
    notifyListeners();
  }

  List<bool> isBookmarkedList =
      List.generate(accomodationList.length, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }

  List<bool> ammenitiesvalues = [true, false];
  List<String> ammenitiesLabels = [
    "Ammenities",
    "Reviews",
  ];

  void onAmmenitiesChanged(int index, bool? value) {
    for (int i = 0; i < ammenitiesvalues.length; i++) {
      ammenitiesvalues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  bool showAllAmmenities = false;

  void toggleShowAllAmmenities() {
    showAllAmmenities = !showAllAmmenities;
    notifyListeners();
  }

  String seeAllAndSeeLessString(int index) {
    if (index == 2) {
      return 'See All';
    } else if (index == ammenitiesList.length - 1) {
      return 'See Less';
    }
    return '';
  }

  bool isSellAndSeeLessShow(int index) {
    return index == 2 && !showAllAmmenities ||
        index == ammenitiesList.length - 1 && showAllAmmenities;
  }
}
