import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:take_me_out/models/all_users_model.dart';


class AllUsersController extends GetxController {
  var isLoading = false.obs;
  AllUsersModel? allUsersModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }


  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          'https://localhost:7179/api/Users/getAllUser'));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        allUsersModel = AllUsersModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}