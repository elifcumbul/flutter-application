// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:take_me_out/network/api.dart';
// import '../models/login_result_model.dart';
// import '../models/register_model.dart';


// Future<LoginResultModel> register(RegisterModel register) async {
//   Dio dio = new Dio();
//   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//       (HttpClient client) {
//     client.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     return client;
//   };

//   var dataSubmit = {
//     "name": register.name,
//     "surname": register.surname,
//     "userName": register.userName,
//     "email": register.email,
//     "password": register.password
//   };


//   var result = await dio.post(registerAPI,
//     options: Options(
//       headers: {
//         Headers.contentTypeHeader: "application/json",
//         Headers.acceptHeader: "application/json"
//       },
//       followRedirects: false,
//       validateStatus: (status) => status! < 500,
//     ),
//     data: jsonEncode(dataSubmit)
//   );

//   if(result.statusCode == 200) {
//     return LoginResultModel(statusCode: 200, message: 'Register success!');
//   } else if(result.statusCode == 409) {
//     return LoginResultModel(statusCode: 409, message: 'Email already exists');
//   } else {
//     return LoginResultModel(statusCode: result.statusCode!.toInt(), message: result.data.toString());
//   }
// }
