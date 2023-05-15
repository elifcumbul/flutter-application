import 'package:flutter/material.dart';
import 'package:take_me_out/models/register_model.dart';
import 'package:take_me_out/pages/components/signup_comp/signup_background.dart';
import 'package:take_me_out/pages/login_page.dart';
import 'package:take_me_out/services/registration_service.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  // final _user = RegisterModel(
  //     name: '',
  //     surname: '',
  //     userName: '',
  //     email: '',
  //     password: ''
  // );

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final _registrationService = RegistrationService();
      // final success = await registrationService.register(_user);
      // if (success) {
      //   //Redirect user to login screen
      // } else {
      //   //Display error message
      // }
      setState(() {
        _isLoading = true;
      });

      final registration = RegisterModel(
        name: _nameController.text,
        surname: _surnameController.text,
        userName: _userNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      try {
        // Submit the registration data to the server
        final success = await _registrationService.register(registration);

        if (success == true) {
          // If registration is successful, show a success message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful!')));

          // Navigate to the login screen
        } else {
            // If registration is not successful, show an error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
            'Registration failed. Please try again.')));
        }
      } catch (error) {
        // If there's an error, show an error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
          Text('An error occurred. Please try again.')));
      }
    }
  
  }

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
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                // onSaved: (newValue) {
                //   _user.name = newValue!;
                // },
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                controller: _surnameController,
                // onSaved: (newValue) {
                //   _user.surname = newValue!;
                // },
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
                controller: _userNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                // onSaved: (newValue) {
                //   _user.userName = newValue!;
                // },
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
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                // onSaved: (newValue) {
                //   _user.email = newValue!;
                // },
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
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                // onSaved: (newValue) {
                //   _user.password = newValue!;
                // },
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
                  onPressed: _register,
                  // onPressed: () async {
                  //   if (_formKey.currentState!.validate()) {
                  //     final registrationService = RegistrationService();
                  //     // If the form is valid, create a new instance of RegistrationModel
                  //     final registrationData = RegisterModel(
                  //       name: _nameController.text.trim(),
                  //       surname: _surnameController.text.trim(),
                  //       userName: _userNameController.text.trim(),
                  //       email: _emailController.text.trim(),
                  //       password: _passwordController.text.trim(),
                  //     );

                  //     try {
                  //       // Submit the registration data to the server
                  //       final response = await registrationService
                  //           .register(registrationData);

                  //       if (response == true) {
                  //         // If registration is successful, show a success message
                  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //             content: Text('Registration successful!')));

                  //         // Navigate to the login screen
                  //         Navigator.of(context).pushReplacementNamed('/login');
                  //       } else {
                  //         // If registration is not successful, show an error message
                  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //             content: Text(
                  //                 'Registration failed. Please try again.')));
                  //       }
                  //     } catch (error) {
                  //       // If there's an error, show an error message
                  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //           content:
                  //               Text('An error occurred. Please try again.')));
                  //     }
                  //   }
                  // },
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
}
