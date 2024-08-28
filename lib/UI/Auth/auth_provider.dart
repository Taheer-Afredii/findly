// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:findly/Core/Constant/enum.dart';
import 'package:findly/Core/Custom/pick_image.dart';
import 'package:findly/Models/user_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController firsNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  UserModel userModel = UserModel();
  List<UserModel> users = [];
  //password visibility
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  String? studentProfile;
  void setStudentProfile() {
    ImagePickerUtil.pickImage().then((String? value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("studentProfile", value!);
      print("value $value");
      studentProfile = value;
      print("studentProfile $studentProfile");
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

  setAsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("isguest", true);
  }

  bool signInLoading = false;
  Future<void> signIn(String userName, String password) async {
    users.clear();
    signInLoading = true;
    notifyListeners();
    log("username: $userName, password: $password");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      users = await loadUsers();
      log("users: ${users.length}");
      bool userFound = false;
      for (var user in users) {
        if (user.userName == userName && user.password == password) {
          prefs.setString('username', userName);
          prefs.setString('password', password);
          prefs.setBool("isguest", false);
          signInLoading = false;
          notifyListeners();
          Get.offAll(const MainBottomNavigationbar());
          return;
        }
      }
      signInLoading = false;
      notifyListeners();
      if (!userFound) {
        print("User not found or incorrect password");
        Get.snackbar('User not found', 'User not found or incorrect password');
      }
      throw Exception('User not found or incorrect password');
    } catch (e) {
      signInLoading = false;
      notifyListeners();
      print("Error: $e");
      // Get.snackbar('Error', e.toString());
    }
  }

  bool signUpLoading = false;

  signUp(String? image, String userName, UserType userType, String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (image != null) {
      userModel.image = image;
      notifyListeners();
    }

    userModel.email = emailController.text;
    userModel.firstName = firsNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.password = passwordController.text;
    userModel.fullNaame = "${userModel.firstName} ${userModel.lastName}";
    userModel.userName = userName;
    userModel.role = role;
    userModel.userType = userType;
    prefs.setString('username', userName);
    prefs.setString('password', userModel.password!);
    prefs.setBool("isguest", false);
    users.add(userModel);
    await saveUsersToPrefs();
    clearDate();
    notifyListeners();

    Get.offAll(const MainBottomNavigationbar());
  }

  Future<void> saveUsersToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = jsonEncode(users.map((user) => user.toJson()).toList());
    await prefs.setString('users', usersJson);
  }

  Future<List<UserModel>> loadUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final usersJson = prefs.getString('users');
      if (usersJson != null) {
        List<dynamic> usersList = jsonDecode(usersJson);
        return usersList
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
      }
      return [];
    } catch (e) {
      log("Error: $e");
      Get.snackbar('Error', e.toString());
    }
    return [];
  }

  clearDate() {
    studentProfile = null;
    photographerProfile = null;
    agentProfile = null;
    passwordController.clear();
    confirmPasswordController.clear();
    firsNameController.clear();
    lastNameController.clear();
    emailController.clear();

    notifyListeners();
  }
}
