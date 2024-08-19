import 'package:findly/Models/listing_model.dart';
import 'package:flutter/material.dart';

class MyListingViewmodel extends ChangeNotifier {
  void onDelete(int index) {
    listingList.removeAt(index);
    notifyListeners();
  }
}
