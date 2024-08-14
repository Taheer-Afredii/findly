import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmmenitiesWidgetModel {
  final String image;
  final double imageHeight;
  final double imageWidth;
  final String text;
  final bool isSeeAll;
  final Function onSeeAllTap;

  AmmenitiesWidgetModel({
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    required this.text,
    this.isSeeAll = false,
    required this.onSeeAllTap,
  });
}

List<AmmenitiesWidgetModel> ammenitiesList = [
  AmmenitiesWidgetModel(
    image: wifi,
    imageHeight: 13.h,
    imageWidth: 13.w,
    text: "Wifi",
    onSeeAllTap: () {},
  ),
  AmmenitiesWidgetModel(
    image: transport,
    imageHeight: 10.11.h,
    imageWidth: 13.w,
    text: "Transport",
    onSeeAllTap: () {},
  ),
  AmmenitiesWidgetModel(
    image: gym,
    imageHeight: 10.11.h,
    imageWidth: 13.w,
    text: "Gym",
    onSeeAllTap: () {},
  ),
  AmmenitiesWidgetModel(
    image: gym,
    imageHeight: 10.11.h,
    imageWidth: 13.w,
    text: "Gym",
    onSeeAllTap: () {},
  ),
  AmmenitiesWidgetModel(
    image: gym,
    imageHeight: 10.11.h,
    imageWidth: 13.w,
    text: "Gym",
    onSeeAllTap: () {},
  ),
];
