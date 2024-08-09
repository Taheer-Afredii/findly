import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/Constant/assets_constant.dart';

class Categories {
  final String? text;
  final String? image;
  final double? height;
  final double? width;
  final double? textwidth;

  Categories({this.text, this.image, this.height, this.width, this.textwidth});
}

List<Categories> categories = [
  Categories(
    text: "Communes",
    image: communes,
    height: 36.h,
    width: 33.85.w,
  ),
  Categories(
    text: "NSFAS",
    image: nsfas,
    height: 35.h,
    width: 30.39.w,
  ),
  Categories(
    text: "Apartments",
    image: appartment,
    height: 33.h,
    width: 33.05.w,
  ),
  Categories(
    text: "Flats",
    image: flats,
    height: 33.h,
    width: 31.63.w,
  ),
  Categories(
    text: "Flats",
    image: flats,
    height: 33.h,
    width: 31.63.w,
  ),
];

class AccommodationModel {
  final String? image;
  final String? location;
  final String? price;
  final String? rating;
  final String? gender;
  final bool? status;
  final bool isMale;
  final bool isFemale;
  final bool isUnix;

  AccommodationModel({
    this.image,
    this.location,
    this.price,
    this.rating,
    this.status,
    this.gender,
    this.isMale = false,
    this.isFemale = false,
    this.isUnix = false,
  });
}

List<AccommodationModel> accomodationList = [
  AccommodationModel(
      image: hostelimage1,
      location: "Westdene, Johannesburg",
      price: "R5000",
      rating: "4.5",
      status: true,
      gender: "Female only",
      isFemale: true),
  AccommodationModel(
    image: hostelimage2,
    location: "Brixton, Johannesburg",
    price: "R2600",
    rating: "5.0",
    status: false,
    gender: "unix",
    isUnix: true,
  ),
  AccommodationModel(
      image: hostelimage3,
      location: "Westdene, Johannesburg",
      price: "R5000",
      rating: "4.9",
      status: true,
      gender: "Male only",
      isMale: true),
];
