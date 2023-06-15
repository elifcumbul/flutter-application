import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:take_me_out/models/friends_by_username_model.dart';


class FriendsByUsernameController extends GetxController {
  final String profileKey;
  FriendsByUsernameController({required this.profileKey});

  //TextEditingController usernameController = TextEditingController();
  late String user = profileKey;
  FriendsByUsernameModel? friendsByUsernameModel;
  
  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }


  fetchData() async {
    
    try {
      String url = 'https://localhost:7179/api/Users/getByUserName?UserName=$user';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        friendsByUsernameModel = FriendsByUsernameModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    }
  }
}