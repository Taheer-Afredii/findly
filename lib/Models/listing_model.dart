import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/enum.dart';

class ListingModel {
  String? title;
  String? location;
  String? price;
  String? rating;
  String? status;
  String? image;
  ServiceType? serviceType;

  ListingModel({
    this.location,
    this.price,
    this.rating,
    this.status,
    this.image,
    this.serviceType,
    this.title,
  });
}

List<ListingModel> listingList = [
  ListingModel(
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    status: "Available",
    image: hostelimage1,
    serviceType: ServiceType.accommodation,
  ),
  ListingModel(
    title: "Accounting Textbook",
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    image: hostelimage2,
    serviceType: ServiceType.marketplace,
  ),
  ListingModel(
    title: "TDE Photography",
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    image: hostelimage1,
    serviceType: ServiceType.photography,
  ),
];
