import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/welcome_background.dart';
import 'package:take_me_out/pages/login_page.dart';

import '../signup_page.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "WELCOME",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Color.fromARGB(255, 14, 17, 43),
                ),
              ),
              SizedBox(height: size.height * 0.001),
              const Text(
                "to",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 14, 17, 43),
                ),
              ),
              const Text(
                "TAKE ME OUT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                  color: Color.fromARGB(255, 14, 17, 43),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              // Image.asset(
              //   'assets/images/people.png',
              //   height: size.height * 0.3,
              // ),
              SizedBox(height: size.height * 0.05),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0)),
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 228, 174, 88)), 
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context){
                            return LoginPage();
                          }
                        ),
                      );
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Color.fromARGB(255, 14, 17, 43),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0)),
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 14, 17, 43)), 
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context){
                            return const SignupPage();
                          }
                        ),
                      );
                    },
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(
                        color: Color.fromARGB(255, 228, 174, 88),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            ),
        ));
  }
}

