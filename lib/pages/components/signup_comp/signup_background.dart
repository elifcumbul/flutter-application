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
            bottom: -40,
            right: -45,
            child: Image.asset(
              "assets/stickers/mountain_bike.png",
              width: size.width * 0.8,
            ),
          ),
          child,
        ],
      ),
    );
  }
}