import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:take_me_out/pages/welcome_page.dart';
import 'package:take_me_out/theme/color_scheme.dart';
 import 'dart:io';
//import 'contollers/get_controllers.dart';

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<void> main() async {
  //   await getControllers();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const tmoTheme = TmoTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Take Me Out',
      theme: tmoTheme.toThemeData(),
      home: WelcomePage(),
    );
  }
}
