import 'package:flutter/material.dart';
import 'package:take_me_out/pages/welcome_page.dart';
import 'package:take_me_out/theme/color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const tmoTheme = TmoTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Take Me Out',
      theme: tmoTheme.toThemeData(),
      home: const WelcomePage(),
    );
  }
}

