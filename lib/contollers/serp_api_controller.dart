import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:take_me_out/models/serp_model.dart';

class SerpApiController extends GetxController {
  SerpModel? serpModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(ApiKey));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        serpModel = SerpModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    }
  }
}
