import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/tabs/home_page_tab.dart';

import '../models/add_event_model.dart';

class AddEventController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController creatorController = TextEditingController();
  String id = "";
  String token = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    addEvent();
    getToken();
    extractUserIdFromToken();
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedToken = prefs.getString('token') ?? '';
    return storedToken;
  }

  // Call this function when you need to extract the user ID from the token
  Future<String> extractUserIdFromToken() async {
    String token = await getToken();

    if (token.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String userId = decodedToken.values.elementAt(0); // Assuming the user ID is stored as 'userId' in the token payload
      return userId;
    }

    return ''; // Return an empty string or handle the case when the token is empty or invalid
  }




  Future<void> addEvent() async {
    String id = await extractUserIdFromToken();
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('https://localhost:7179/api/Events/addEvent');
      Map body = {
        'name': nameController.text,
        'description': descriptionController.text,
        'eventTime': eventTimeController.text,
        'eventDate': eventDateController.text,
        'categoryId': "050a0e67-560b-4095-e037-08db65163e3c",
        'creatorId': id,
      };

      http.Response response = 
          await http.post(url, body: jsonEncode(body), headers: headers);


      if(response.statusCode == 200){
        final json =jsonDecode(response.body);
        if(json['success'] == true){
          nameController.clear();
          descriptionController.clear();
          eventTimeController.clear();
          eventDateController.clear();
          categoryIdController.clear();
          creatorController.clear();
          Get.off(HomePage());
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
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}

// class AddEventController extends GetxController {

//     Future<void> addEvent(AddEventModel addEventModel) async {

//     final url = Uri.parse('https://localhost:7179/api/Events/addEvent');
//     final headers = {'Content-Type': 'application/json'};
//     final body = json.encode(addEventModel.toJson());

//     try {
//       final response = await http.post(url, headers: headers, body: body);
//       if (response.statusCode == 200) {
//         // Event added successfully
//         print('Event added successfully');
//       } else {
//         // Error occurred
//         print('Failed to add event: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Exception occurred
//       print('Failed to add event: $e');
//     }
//   }
// }