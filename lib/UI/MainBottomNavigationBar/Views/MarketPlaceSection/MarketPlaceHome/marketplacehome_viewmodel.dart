import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/Widgets/marketplace_topitem_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketplacehomeViewmodel extends ChangeNotifier {
  String search = '';

  void setSearch(String value) {
    search = value;
    notifyListeners();
  }

  void onCategoryChanged(int index) {
    for (int i = 0; i < marketPlaceCategoryList.length; i++) {
      marketPlaceCategoryList[i].isSelected = i == index;
    }
    notifyListeners();
  }

  List<bool> isBookmarkedList =
      List.generate(topItems.length, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }

  List<bool> isResultBookmarkedList =
      List.generate(topItemsReult.length, (index) => false);

  void toggleTopItemResultBookmark(int index) {
    isResultBookmarkedList[index] = !isResultBookmarkedList[index];
    notifyListeners();
  }
}

class MarketplaceCategoryModel {
  String? title;
  String? icon;
  double? height;
  double? width;
  bool? isSelected;
  double? textWidth;

  MarketplaceCategoryModel(
      {this.title,
      this.icon,
      this.height,
      this.width,
      this.isSelected,
      this.textWidth});
}

List<MarketplaceCategoryModel> marketPlaceCategoryList = [
  MarketplaceCategoryModel(
      title: "TextBooks",
      icon: textbook,
      isSelected: true,
      height: 34.h,
      width: 31.63.w,
      textWidth: 70.87.w),
  MarketplaceCategoryModel(
    title: "Calculators",
    icon: calculator,
    isSelected: false,
    height: 34.h,
    width: 27.19.w,
    textWidth: 75.w,
  ),
  MarketplaceCategoryModel(
    title: "Laptops",
    icon: laptop,
    isSelected: false,
    height: 33.h,
    width: 40.w,
    textWidth: 91.w,
  ),
  MarketplaceCategoryModel(
    title: "Stationary",
    icon: stationary,
    isSelected: false,
    height: 40.h,
    width: 27.68.w,
    textWidth: 75.w,
  ),
];
