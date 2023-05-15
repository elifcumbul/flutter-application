import 'package:flutter/material.dart';
import 'package:take_me_out/models/login_model.dart';
import 'package:take_me_out/network/login.dart';
import 'package:take_me_out/pages/components/rounded_input_field.dart';
import 'package:take_me_out/pages/components/rounded_password_field.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/pages/signup_page.dart';
import 'package:take_me_out/state/state.dart';
import 'package:take_me_out/view_model/main/main_view_model.dart';
import 'login_background.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  
  // String? userNameOrMail;
  // String? passsword;
  LoginModel loginModel = new LoginModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedInputField(
            hintText: "Email",
            onChanged: (value) {
              setState(() {
                loginModel.userNameOrMail = value;
              });
            },
          ),
          RoundedPasswordField(
            onChanged: (value) {
              setState(() {
                loginModel.password = value;
              });
            },
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
                  // if(loginModel != null && passsword != null && bearerToken != null){
                  //   LoginModel loginData = LoginModel(
                  //   userNameOrMail: userNameOrMail,
                  //   password: passsword,
                  // );
                  // login(loginData);
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => const HomePage()),
                  // );
                  // }
                  if(loginModel.userNameOrMail != null && loginModel.password != null && bearerToken != null){
                    login(loginModel);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
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
                        return const SignupPage();
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

