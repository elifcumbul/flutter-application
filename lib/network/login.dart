import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:take_me_out/network/api.dart';
import '../models/login_model.dart';
import '../models/login_result_model.dart';


Future<LoginResultModel> login(LoginModel login) async {
  Dio dio = new Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  var dataSubmit = {
    "userNameOrMail": login.userNameOrMail,
    "password": login.password
  };


  var result = await dio.post(loginAPI,
    options: Options(
      headers: {
        Headers.contentTypeHeader: "application/json",
        Headers.acceptHeader: "application/json"
      },
      followRedirects: false,
      validateStatus: (status) => status! < 500,
    ),
    data: jsonEncode(dataSubmit)
  );

  if(result.statusCode == 401) {
    return LoginResultModel(statusCode: 401, message: 'Login failed ! Please check user/password');
  } else if(result.statusCode == 200) {
    return LoginResultModel(statusCode: result.statusCode, message: result.data.toString());
  } else {
    return LoginResultModel(statusCode: result.statusCode!.toInt(), message: result.data.toString());
  }
}
