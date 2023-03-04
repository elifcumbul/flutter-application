import 'package:flutter/material.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/widgets/color_scheme.dart';

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
      title: 'Take Me Out',
      theme: tmoTheme.toThemeData(),
      home: const HomePage(),
    );
  }
}

