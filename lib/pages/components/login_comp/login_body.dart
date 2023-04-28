import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/rounded_input_field.dart';
import 'package:take_me_out/pages/components/rounded_password_field.dart';
import 'package:take_me_out/pages/signup_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_background.dart';
import 'package:http/http.dart' as http;

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _storage = FlutterSecureStorage();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    final response = await http.post(
      Uri.parse('https://localhost:7179/api/Auths/login'),
      body: jsonEncode({
        'userNameOrMail': _emailController.text,
        'password': _passwordController.text,
      }),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];

      await _storage.write(key: 'token', value: token);

      Navigator.of(context).pushReplacementNamed('/home');

    } else {
      final message = jsonDecode(response.body)['message'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedInputField(
            hintText: "Email",
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
                onPressed: _login,
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

void fetchUserData() async {
  final token = await FlutterSecureStorage().read(key: 'token');
  final response = await http.get(
    Uri.parse('https://localhost:7179/api/Users/getById'),
    headers: {'Authorization': 'Bearer $token'},
  );

  if(response.statusCode == 200) {
    final userData = jsonDecode(response.body);
  }
}