import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'userNameOrMail': emailController.text.trim(),
        'password': passswordController.text
      };
      http.Response response =  
          await http.post(url, body: jsonEncode(body), headers: headers);
      
      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if(json['token'] != null) {
          var token = json['token']['accessToken'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);

          emailController.clear();
          passswordController.clear();
          Get.off(HomePage());
        } else {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
