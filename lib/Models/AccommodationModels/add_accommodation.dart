class AddAccommodationModel {
  String? title;
  String? reference;
  String? category;
  double? lat;
  double? long;
  String? tenantType;
  String? description;
  List<String>? amenities;
  List<String>? images;
  String? roomTypes;
  int? price;
  String? availability;

  AddAccommodationModel({
    this.title,
    this.reference,
    this.category,
    this.lat,
    this.long,
    this.tenantType,
    this.description,
    this.amenities,
    this.images,
    this.roomTypes,
    this.price,
    this.availability,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "reference": reference,
      "category": category,
      "lat": lat.toString(),
      "long": long.toString(),
      "tenantType": tenantType,
      "description": description,
      "amenities": amenities,
      "images": images ?? [],
      "roomTypes": roomTypes,
      "price": price,
      "availility": availability,
    };
  }
}
