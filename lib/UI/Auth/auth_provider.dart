import 'package:findly/Core/Custom/pick_image.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  //password visibility
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  String? studentProfile;
  void setStudentProfile() {
    ImagePickerUtil.pickImage().then((String? value) {
      studentProfile = value;
      notifyListeners();
    });
  }

  String? photographerProfile;
  void setPhotographerProfile() {
    ImagePickerUtil.pickImage().then((String? value) {
      photographerProfile = value;
      notifyListeners();
    });
  }

  String? agentProfile;
  void setAgentProfile() {
    ImagePickerUtil.pickImage().then((String? value) {
      agentProfile = value;
      notifyListeners();
    });
  }
}
