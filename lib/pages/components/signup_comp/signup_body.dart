import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_me_out/contollers/register_controller.dart';
import 'package:take_me_out/pages/components/signup_comp/signup_background.dart';
import 'package:take_me_out/pages/login_page.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(
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
                controller: registerController.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
                controller: registerController.surnameController,
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
                controller: registerController.userNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
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
                controller: registerController.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
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
                controller: registerController.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
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
                  onPressed: () {
                    registerController.registerWithEmail();
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:take_me_out/pages/components/signup_comp/signup_background.dart';

// import '../../../contollers/register_controller.dart';
// import '../../login_page.dart';
// import '../login_comp/login_body.dart';

// String name = "";
// String surname = "";
// String userName = "";
// String email = "";
// String passsword = "";

// class SignupBody extends GetWidget<RegisterController> {
//   const SignupBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SignupBackground(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: size.height * 0.07),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10.0),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//             width: size.width * 0.8,
//             height: 60.0,
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 238, 181, 88),
//                 borderRadius: BorderRadius.circular(29)),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//                 border: InputBorder.none,
//               ),
//               onChanged: ((value) {
//                 name = value;
//               }),
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10.0),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//             width: size.width * 0.8,
//             height: 60.0,
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 238, 181, 88),
//                 borderRadius: BorderRadius.circular(29)),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Surname',
//                 border: InputBorder.none,
//               ),
//               onChanged: (value) {
//                 surname = value;
//               },
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10.0),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//             width: size.width * 0.8,
//             height: 60.0,
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 238, 181, 88),
//                 borderRadius: BorderRadius.circular(29)),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Username',
//                 border: InputBorder.none,
//               ),
//               onChanged: (value) {
//                 userName = value;
//               },
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10.0),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//             width: size.width * 0.8,
//             height: 60.0,
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 238, 181, 88),
//                 borderRadius: BorderRadius.circular(29)),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 suffixIcon: Icon(Icons.mail),
//                 labelText: 'Email',
//                 border: InputBorder.none,
//               ),
//               onChanged: (value) {
//                 email = value;
//               },
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10.0),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//             width: size.width * 0.8,
//             height: 60.0,
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 238, 181, 88),
//                 borderRadius: BorderRadius.circular(29)),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 suffixIcon: Icon(Icons.lock),
//                 labelText: 'Password',
//                 border: InputBorder.none,
//               ),
//               onChanged: (value) {
//                 passsword = value;
//               },
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             width: size.width * 0.8,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(29),
//               child: TextButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
//                       vertical: 20.0, horizontal: 40.0)),
//                   backgroundColor: MaterialStateProperty.all(
//                       const Color.fromARGB(255, 14, 17, 43)),
//                 ),
//                 onPressed: () => _onTap(),
//                 child: const Text(
//                   "SIGNUP",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 228, 174, 88),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: size.height * 0.01),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Already have an Account ?",
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 14, 17, 43),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return LoginPage();
//                       },
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   " Login",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 14, 17, 43),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
//             width: size.width * 0.8,
//             child: Row(
//               children: [
//                 buildDivider(),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     "OR",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 14, 17, 43),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 buildDivider(),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 0.1,
//                     color: const Color.fromARGB(255, 14, 17, 43),
//                   ),
//                   shape: BoxShape.circle,
//                 ),
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 padding: const EdgeInsets.all(10),
//                 child: IconButton(
//                   icon: Image.asset(
//                     'assets/icons/twitter.png',
//                     width: 25,
//                     height: 25,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 0.1,
//                     color: const Color.fromARGB(255, 14, 17, 43),
//                   ),
//                   shape: BoxShape.circle,
//                 ),
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 padding: const EdgeInsets.all(10),
//                 child: IconButton(
//                   icon: Image.asset(
//                     'assets/icons/google_plus.png',
//                     width: 25,
//                     height: 25,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 0.1,
//                     color: const Color.fromARGB(255, 14, 17, 43),
//                   ),
//                   shape: BoxShape.circle,
//                 ),
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 padding: const EdgeInsets.all(10),
//                 child: IconButton(
//                   icon: Image.asset(
//                     'assets/icons/facebook.png',
//                     width: 25,
//                     height: 25,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _onTap() {
//     if (name.isNotEmpty &&
//         surname.isNotEmpty &&
//         userName.isNotEmpty &&
//         email.isNotEmpty &&
//         passsword.isNotEmpty) {
//       RegisterController(Get.find()).callingRegisterService(
//         name,
//         surname,
//         userName,
//         email,
//         passsword,
//       );
//       Get.snackbar("Welcome" + userName, "Successful!",
//           icon: const Icon(Icons.back_hand_outlined, color: Colors.green),
//           colorText: Colors.amber,
//           backgroundColor: Colors.amberAccent,
//           duration: const Duration(seconds: 4),
//           titleText: Text(
//             "Welcome" + userName,
//             style: const TextStyle(fontSize: 20),
//           ));
//       Get.offAndToNamed(LoginPage.routeName);
//     } else {
//       Get.snackbar("Error!", "Empty spaces",
//           icon: const Icon(Icons.error_outline_outlined, color: Colors.red),
//           colorText: Colors.orangeAccent,
//           backgroundColor: Colors.orange,
//           duration: const Duration(seconds: 4),
//           titleText: const Text(
//             "Error!",
//             style: TextStyle(fontSize: 20),
//           ));
//     }
//   }

//   Expanded buildDivider() {
//     return const Expanded(
//       child: Divider(
//         color: Color.fromARGB(255, 14, 17, 43),
//         height: 1.5,
//       ),
//     );
//   }
// }
