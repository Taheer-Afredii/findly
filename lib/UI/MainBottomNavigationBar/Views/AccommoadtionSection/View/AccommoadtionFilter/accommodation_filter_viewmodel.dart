import 'package:flutter/material.dart';

class AccommodationFilterViewmodel extends ChangeNotifier {
  List<bool> catagoryValues = [true, false, false, false];
  List<String> catagoryLabels = ["NSFAS", "Communes", "Apartments", "Flats"];

  void onCategoryChanged(int index, bool? value) {
    for (int i = 0; i < catagoryValues.length; i++) {
      catagoryValues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  //************** Room Type **********/

  List<bool> roomtypesvalues = [true, false, false, false, false, false];
  List<String> roomtypeLabels = [
    "Single Room",
    "Sharing",
    "Bachelor",
    "Cottage",
    "Ensuite",
    "Studio"
  ];

  void onRoomTypeChanged(int index, bool? value) {
    for (int i = 0; i < roomtypesvalues.length; i++) {
      roomtypesvalues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  //**************** Anenities **********/

  List<bool> anenitiesValues = [true, false, false, false, false];
  List<String> anenitiesLabels = [
    "Wifi",
    "Transport",
    "Swimming pool",
    "Gym",
    "Etc"
  ];

  void onAmenitiesChanged(int index, bool? value) {
    for (int i = 0; i < anenitiesValues.length; i++) {
      anenitiesValues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  //************** Availability **********/

  List<bool> availabilityValues = [true, false];
  List<String> availabilityLabels = ["Show all", "Only show available"];

  void onAvailabilityChanged(int index, bool? value) {
    for (int i = 0; i < availabilityValues.length; i++) {
      availabilityValues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  //************** Tenant Type **********/

  List<bool> tenantTypeValues = [true, false, false];
  List<String> tenantTypeLabels = [
    "Male only",
    "Female only",
    "Unisex",
  ];

  void onTenantTypeChanged(int index, bool? value) {
    for (int i = 0; i < tenantTypeValues.length; i++) {
      tenantTypeValues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }
}
