import 'package:flutter/material.dart';

class SignupBackground extends StatelessWidget {
  final Widget child;
  const SignupBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: -70,
            child: Image.asset(
              "assets/images/circle.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: -100,
            right: -90,
            child: Image.asset(
              "assets/images/circle_light.png",
              width: size.width * 0.8,
            ),
          ),
          child,
        ],
      ),
    );
  }
}