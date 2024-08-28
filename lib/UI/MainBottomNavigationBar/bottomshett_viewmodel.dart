import 'dart:convert';

import 'package:findly/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomshettViewmodel extends ChangeNotifier {
  BottomshettViewmodel() {
    init();
  }

  init() {
    getGuest();
    loadAllUserFromSharedpref();
  }

  int currentIndex = 0;
  List<UserModel> users = [];
  UserModel currentUser = UserModel();

  onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool canPop = false;

  bool onPopScope(bool didPop) {
    if (didPop) {
      canPop = false;
      notifyListeners();
      return false;
    }
    if (currentIndex != 0) {
      currentIndex = 0;
      notifyListeners();
      canPop = false;
      return false;
    }
    canPop = true;
    notifyListeners();
    return true; // Indicate that the app should exit
  }

  bool isGuest = false;
  getGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool guest = prefs.getBool("isguest") ?? true;
    isGuest = guest;
    notifyListeners();
  }

  Future<void> loadAllUserFromSharedpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userName = prefs.getString('username');
      String? password = prefs.getString('password');
      if (userName != null && password != null) {
        users = await loadUsers();

        for (var user in users) {
          if (user.userName == userName && user.password == password) {
            currentUser = user;
            notifyListeners();
            return;
          }
        }
        throw Exception('User not found or incorrect password');
      } else {
        print('==============> No user found in bottomsheet viewmodel');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<List<UserModel>> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson != null) {
      List<dynamic> usersList = jsonDecode(usersJson);
      return usersList.map((userJson) => UserModel.fromJson(userJson)).toList();
    }
    return [];
  }
}
