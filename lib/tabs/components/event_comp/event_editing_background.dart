import 'package:flutter/material.dart';

class EventEditingBackground extends StatelessWidget {
  final Widget child;
  const EventEditingBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -45,
            child: Image.asset(
              "assets/images/circle_light.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: -70,
            right: -85,
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