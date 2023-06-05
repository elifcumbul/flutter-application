import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_me_out/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class AddPhotoController extends GetxController{
  TextEditingController photoController = TextEditingController();
  TextEditingController idController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addPhotoToProfile() async {
    try{
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.userEndPoints.addPhoto);
      Map body = {
        'photoUrl': photoController.text,
        'id': idController.text,
      };

      http.Response response = 
          await http.post(url, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        final json =jsonDecode(response.body);
        if(json['success'] == true){
          photoController.clear();
          idController.clear();
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
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
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}