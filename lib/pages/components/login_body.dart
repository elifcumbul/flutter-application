import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/rounded_input_field.dart';
import 'package:take_me_out/pages/components/rounded_password_field.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/pages/signup_page.dart';
import 'login_background.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 14, 17, 43)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return HomePage();
                      }
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Color.fromARGB(255, 228, 174, 88),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an Account ?",
                style: TextStyle(
                  color: Color.fromARGB(255, 14, 17, 43),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context) {
                        return SignupPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  " Sign Up",
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 17, 43),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

