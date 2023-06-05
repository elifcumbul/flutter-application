import 'dart:convert';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:take_me_out/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  String token = '';
  String userId = '';
  UserModel? userModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
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

  fetchData() async {
    String id = await extractUserIdFromToken();
    String apiKey = 'https://localhost:7179/api/Users/getById?UserId=$id';
    try {
      isLoading(true);
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
    } finally {
      isLoading(false);
    }
  }
}