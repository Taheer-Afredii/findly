// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snakbar.dart';
import 'package:findly/Core/Custom/image_to_firebase.dart';
import 'package:findly/Core/Custom/pick_image.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/app_userr_model.dart';
import 'package:findly/Models/user_model.dart';
import 'package:findly/Models/user_response_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
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

  bool validatePassword(String password) {
    const String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$';
    final RegExp regex = RegExp(passwordPattern);
    return regex.hasMatch(password);
  }

  String? studentProfile;
  void setStudentProfile() {
    ImagePickerUtil.pickImage().then((String? value) async {
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

  //***************************** CREATE ACCOUNT *********************/

  bool studentSignUpLoading = false;
  bool photographerSignUpLoading = false;
  bool agentSignUpLoading = false;
  //create agent account
  UserData user = UserData();
  void createAgentAccount({
    required String username,
    required bool isSocial,
    required String agentNumber,
  }) async {
    agentSignUpLoading = true;
    notifyListeners();
    String image = agentProfile != null
        ? await imageToFirebaseStorage(imagePath: agentProfile!)
        : "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AgentModel agentData = AgentModel(
      email: emailController.text,
      firstName: firsNameController.text,
      lastName: lastNameController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      username: username,
      imageUrl: image,
      role: "Agent",
      signUp: isSocial ? "Social" : "Email",
      agentNumber: agentNumber,
    );

    try {
      var response = await apiService.request(
        endPoint: userRegisterUrl,
        type: RequestType.post,
        body: agentData.toJson(),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        user = UserData.fromJson(responseJson['data']);

        print('User ID: ${user.id}');
        print('First Name: ${user.firstName}');
        print('Email: ${user.email}');
        prefs.setString('username', username);
        prefs.setString("email", emailController.text);
        clearDate();
        agentSignUpLoading = false;
        notifyListeners();
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error: $errorMessage');
        log('Error stuscode: ${response.statusCode}');
        kGetSnakBar(text: errorMessage, title: "Error");
        agentSignUpLoading = false;
        notifyListeners();
      }
    } catch (e) {
      agentSignUpLoading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  //create student account
  createStudentAccount({
    required String username,
    required bool isSocial,
    required String studentCampus,
    required String studentNumber,
  }) async {
    studentSignUpLoading = true;
    notifyListeners();
    String image = studentProfile != null
        ? await imageToFirebaseStorage(imagePath: studentProfile!)
        : "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StudentModel studentData = StudentModel(
      email: emailController.text,
      firstName: firsNameController.text,
      lastName: lastNameController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      username: username,
      imageUrl: image,
      role: "Student",
      signUp: isSocial ? "Social" : "Email",
      studentCampus: studentCampus,
      studentNumber: studentNumber,
    );

    try {
      var response = await apiService.request(
        endPoint: userRegisterUrl,
        type: RequestType.post,
        body: studentData.toJson(),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        user = UserData.fromJson(responseJson['data']);
        prefs.setString('username', username);
        prefs.setString("email", emailController.text);

        print('User ID: ${user.id}');
        print('First Name: ${user.firstName}');
        print('Email: ${user.email}');

        clearDate();

        studentSignUpLoading = false;
        notifyListeners();
        Get.offAll(const MainBottomNavigationbar());
      } else {
        studentSignUpLoading = false;
        notifyListeners();
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        kGetSnakBar(
            text: errorMessage,
            title: "Error",
            backgroundColor: secondaryColor);
        print('Error: $errorMessage');
        // Handle the error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      studentSignUpLoading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  //create photographer account
  void createPhotographerAccount({
    required String username,
    required bool isSocial,
  }) async {
    photographerSignUpLoading = true;
    notifyListeners();
    String image = agentProfile != null
        ? await imageToFirebaseStorage(imagePath: agentProfile!)
        : "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PhotographerModel photographerData = PhotographerModel(
      email: emailController.text,
      firstName: firsNameController.text,
      lastName: lastNameController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      username: username,
      imageUrl: image,
      role: "Photographer",
      signUp: isSocial ? "Social" : "Email",
    );

    try {
      var response = await apiService.request(
        endPoint: userRegisterUrl,
        type: RequestType.post,
        body: photographerData.toJson(),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        user = UserData.fromJson(responseJson['data']);
        prefs.setString('username', username);
        prefs.setString("email", emailController.text);

        print('User ID: ${user.id}');
        print('First Name: ${user.firstName}');
        print('Email: ${user.email}');
        // Handle the dataclearDate
        clearDate();
        photographerSignUpLoading = false;
        notifyListeners();
        Get.offAll(const MainBottomNavigationbar());
      } else {
        photographerSignUpLoading = false;
        notifyListeners();
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['message'];
        print('Error: $errorMessage');
        // Handle the error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      photographerSignUpLoading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  //******************* End Account Creation **********************************/

  setAsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("isguest", true);
  }

  // signUp(String? image, String userName, UserType userType, String role) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (image != null) {
  //     userModel.image = image;
  //     notifyListeners();
  //   }

  //   userModel.email = emailController.text;
  //   userModel.firstName = firsNameController.text;
  //   userModel.lastName = lastNameController.text;
  //   userModel.password = passwordController.text;
  //   userModel.fullNaame = "${userModel.firstName} ${userModel.lastName}";
  //   userModel.userName = userName;
  //   userModel.role = role;
  //   userModel.userType = userType;
  //   prefs.setString('username', userName);
  //   prefs.setString('password', userModel.password!);
  //   prefs.setBool("isguest", false);
  //   users.add(userModel);
  //   await saveUsersToPrefs();
  //   clearDate();
  //   notifyListeners();

  //   Get.offAll(const MainBottomNavigationbar());
  // }

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
