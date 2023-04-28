import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/signup_comp/signup_background.dart';
import 'package:take_me_out/pages/login_page.dart';
import 'package:http/http.dart' as http;

class SignupBody extends StatefulWidget {
  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _surname = '';
  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SignupBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.07),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              width: size.width * 0.8,
              height: 60.0,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 181, 88),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _name = newValue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              width: size.width * 0.8,
              height: 60.0,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 181, 88),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Surname',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _surname = newValue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              width: size.width * 0.8,
              height: 60.0,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 181, 88),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _username = newValue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              width: size.width * 0.8,
              height: 60.0,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 181, 88),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.mail),
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _email = newValue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              width: size.width * 0.8,
              height: 60.0,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 181, 88),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _password = newValue!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 14, 17, 43)),
                  ),
                  onPressed: _submitForm,
                  child: const Text(
                    "SIGNUP",
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
                  "Already have an Account ?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 17, 43),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    " Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 14, 17, 43),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
              width: size.width * 0.8,
              child: Row(
                children: [
                  buildDivider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: Color.fromARGB(255, 14, 17, 43),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  buildDivider(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.1,
                      color: const Color.fromARGB(255, 14, 17, 43),
                    ),
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/twitter.png',
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.1,
                      color: const Color.fromARGB(255, 14, 17, 43),
                    ),
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/google_plus.png',
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.1,
                      color: const Color.fromARGB(255, 14, 17, 43),
                    ),
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/facebook.png',
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Color.fromARGB(255, 14, 17, 43),
        height: 1.5,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _registerUser();
    }
  }

  void _registerUser() async {
    //fetch data from .Net API
    final response = await http.post(
      Uri.parse('https://your-api-endpoint.com/register'),
      body: {
        'name': _name,
        'surname': _surname,
        'userName': _username,
        'email': _email,
        'password': _password,
      },
    );

    if (response.statusCode == 200) {
      //User regiistered successfully
      //Navigate to login? page or show a success message
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      //handle error
      //show error message or retry registration
      final body = json.decode(response.body);
      final message =
          body['message'] ?? 'An error occurred. Please try again later.';
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
}
