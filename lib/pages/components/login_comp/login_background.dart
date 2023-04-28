import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 120,
            left: -60,
            child: Image.asset(
              "assets/images/circle.png",
              width: size.width * 0.8 ,
            ),
          ),
          Positioned(
            bottom: -120,
            right: -60,
            child: Image.asset(
              "assets/images/circle.png",
              width: size.width * 0.8 ,
            ),
          ),
          child,
        ],
      ),
    );
  }
}