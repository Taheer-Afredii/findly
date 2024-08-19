import 'package:findly/Core/Constant/assets_constant.dart';

class TopRatedPhotographerModel {
  final String? name;
  final String? price;
  final String? rating;
  final String? image;
  final bool? isRated;
  TopRatedPhotographerModel(
      {this.name, this.price, this.rating, this.image, this.isRated});
}

List<TopRatedPhotographerModel> topRatedPhotographer = [
  TopRatedPhotographerModel(
    name: "TDE Photography",
    price: "From R800",
    rating: "4.9",
    image: photography1,
    isRated: true,
  ),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: false,
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      isRated: false,
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: true,
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      isRated: true,
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: true,
      image: photography2),
];

List<TopRatedPhotographerModel> topRatedPhotographerresult = [
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: false,
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      isRated: false,
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: true,
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      isRated: true,
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: true,
      image: photography2),
];
