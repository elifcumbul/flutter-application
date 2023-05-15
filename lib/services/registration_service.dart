import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:http/http.dart' as http;
import '../models/register_model.dart';

class RegistrationService {
  final Dio _dio = Dio();

  static const String url = 'https://localhost:7179/api/Auths/register';

  Future<bool> register(RegisterModel registerModel) async {

    final body = json.encode(registerModel.toJson());
    //final response = await http.post(Uri.parse(url), body: body, headers: {'Content-Type' : 'application/json'});

    try {
      final response = await _dio.post(url,
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
