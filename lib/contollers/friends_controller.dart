import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:take_me_out/models/user_model.dart';

class FriendsController extends GetxController {
  var isLoading = false.obs;
  String token = '';
  String userId = '';
  UserModel? userModel;
  //TextEditingController idController = TextEditingController();


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    String apiKey = 'https://localhost:7179/api/Users/getById?UserId=$userId';
    try {
      http.Response response = await http.get(Uri.parse(
          apiKey));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        userModel = UserModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } 
  }
}