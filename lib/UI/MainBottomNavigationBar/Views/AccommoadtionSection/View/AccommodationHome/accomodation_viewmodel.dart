import 'package:flutter/material.dart';

class AccomodationViewmodel extends ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;

  void setSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }
}
