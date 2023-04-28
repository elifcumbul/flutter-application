import 'package:flutter/material.dart';

class SearchBackground extends StatelessWidget {
  final Widget child;
  const SearchBackground({Key?key, required this.child}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Positioned(
          //   bottom: -200,
          //   right: -75,
          //   child: Image.asset(
          //     "assets/images/circle.png",
          //     width: size.width * 0.8,
          //   ),
          // ),
          Positioned(
            top: -50,
            left: -45,
            child: Image.asset(
              "assets/images/circle_light.png",
              width: size.width * 0.7,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
