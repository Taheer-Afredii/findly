import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Models/GigModels/gig_user_gigs_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GigListingViewmodel extends ChangeNotifier {
  bool loading = false;
  final TextEditingController searchController = TextEditingController();

  init() async {
    loading = true;
    notifyListeners();
    await fetchUserAllGigs();
    loading = false;
    notifyListeners();
  }

  List<GetUserGigsModel> userGigsList = [];
  List<GetUserGigsModel> filterGigs = [];
  fetchUserAllGigs() async {
    userGigsList = [];
    filterGigs = [];
    notifyListeners();
    // First request to get the total count
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      final response = await http.get(
        Uri.parse('$addGigApi?page=1&pageSize=10&search'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final totalCount = data["data"]['total'];
        final page = data["data"]['page'];
        log('Total count fetched in gig $totalCount');
        log('Page fetched ij gig $page');

        // Second request to fetch all accommodations
        final allResponse = await http.get(
          Uri.parse('$addGigApi?page=$page&pageSize=$totalCount&search'),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          },
        );
        if (allResponse.statusCode == 200) {
          final allData = jsonDecode(allResponse.body);

          final gigs = allData["data"]['gigs'] as List;

          userGigsList =
              gigs.map((json) => GetUserGigsModel.fromJson(json)).toList();
          userGigsList.sort((a, b) {
            int updatedAtComparison = b.updatedAt!.compareTo(a.updatedAt!);
            if (updatedAtComparison != 0) {
              return updatedAtComparison;
            } else {
              return b.createdAt!.compareTo(a.createdAt!);
            }
          });
          filterGigs = List.from(userGigsList);
          notifyListeners();
          log('All gig fetched ${userGigsList.length}');
        } else {
          final jsonResponse = jsonDecode(response.body);
          final errorMessage = jsonResponse['error'];
          // kGetSnakBar(text: errorMessage, title: "Error");
          log('Error in my Gig listing screen: $errorMessage');
          log('Error in my Gig listing screen status: ${response.statusCode}');
        }
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        // kGetSnakBar(text: errorMessage, title: "Error");
        log('Error in  getting all Gig list in listing screen: $errorMessage');
        log('Error in in  getting all  gig lis my listing screen status: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //****************Search Accommodation ***************/

  void filterGigsQuery(String query) {
    if (query.isEmpty) {
      filterGigs = List.from(userGigsList);
    } else {
      filterGigs = userGigsList.where((accommodation) {
        return accommodation.name!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            accommodation.description!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            accommodation.price
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            accommodation.regions!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
