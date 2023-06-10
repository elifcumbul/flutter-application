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
      http.Response response = await http.get(Uri.parse(
          'https://serpapi.com/search?api_key=cafd7ffffe328924d0f90c15e6ac9f5b11a5f99b3d34e1b9fffae9ee951d08cb&engine=google_events&no_cache=true&q=Events+in+Izmir&htichips=date:today'));

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

// import 'package:http/http.dart' as http;

// void main() async {
//   final params = {
//     'engine': 'google_events',
//     'q': 'Events in Austin',
//     'hl': 'en',
//     'gl': 'us',
//     'api_key': 'cafd7ffffe328924d0f90c15e6ac9f5b11a5f99b3d34e1b9fffae9ee951d08cb',
//   };

//   final url = Uri.parse('https://serpapi.com/search')
//       .replace(queryParameters: params);

//   final res = await http.get(url);
//   final status = res.statusCode;
//   if (status != 200) throw Exception('http.get error: statusCode= $status');

//   print(res.body);
// }