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
            bottom: -30,
            left: -30,
            child: Image.asset(
              "assets/stickers/lp.png",
              width: size.width * 0.8 ,
            ),
          ),
          child,
        ],
      ),
    );
  }
}