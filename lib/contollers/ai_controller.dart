import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:take_me_out/models/ai_model.dart';


class AiController extends GetxController {
  AiModel? aiModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }


  fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'http://127.0.0.1:5000/'));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        aiModel = AiModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } 
  }
}