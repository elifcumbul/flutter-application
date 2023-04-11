import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget child;
  const WelcomeBackground({
    Key? key,
    required this.child
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This size provide us total height and width of our screen
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // const Positioned(
            //   top: 320,
            //   left: 113,
            //   child: Text(
            //     "TAKE ME OUT",
            //     style: TextStyle(
            //       color: Color.fromARGB(255, 10, 95, 95),
            //       fontSize: 25.0,
            //       fontWeight: FontWeight.w800,
            //     ),
            //   )
            // ),
            Positioned(
              bottom: -30,
              right: 180,
              child: Image.asset(
                'assets/stickers/travel.png',
                width: size.width * 0.6,
                )
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/stickers/holidays.png',
                //width: size.width * 0.3,
                )
            ),
            child,
          ],
        ),
      ),
    );
  }
}