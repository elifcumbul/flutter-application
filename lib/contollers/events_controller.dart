import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/events_model.dart';

class EventsController extends GetxController {
  var isLoading = false.obs;
  EventsModel? eventsModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }


  fetchData() async {
    String apiKey = 'https://localhost:7179/api/Events/getListEvent';
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          apiKey));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        eventsModel = EventsModel.fromJson(result);
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