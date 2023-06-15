import 'package:flutter/material.dart';

class FriendsBackground extends StatelessWidget {
  final Widget child;
  const FriendsBackground({Key? key, required this.child}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: -45,
              child: Image.asset(
                "assets/images/circle.png",
                width: size.width * 0.8,
              ),
            ),
            Positioned(
              bottom: -40,
              left: -45,
              child: Image.asset(
                "assets/images/circle_light.png",
                width: size.width * 0.7,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}