import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_me_out/contollers/login_controller.dart';
import 'package:take_me_out/pages/signup_page.dart';
import 'login_background.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: loginController.emailController,
                textInputAction: TextInputAction.next,
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: loginController.passswordController,
                textInputAction: TextInputAction.next,
              ),
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
                  loginController.loginWithEmail();
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:take_me_out/contollers/login_controller.dart';
// import 'package:take_me_out/pages/components/login_comp/login_background.dart';
// import 'package:take_me_out/pages/components/signup_comp/signup_body.dart';
// import 'package:take_me_out/pages/signup_page.dart';

// import '../../../services/register_service.dart';

// class LoginBody extends GetWidget<LoginController> {
//   const LoginBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return LoginBackground(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//               margin: const EdgeInsets.symmetric(vertical: 10.0),
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//               width: size.width * 0.8,
//               height: 60.0,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 238, 181, 88),
//                   borderRadius: BorderRadius.circular(29)),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   suffixIcon: Icon(Icons.mail),
//                   labelText: 'Email',
//                   border: InputBorder.none,
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 controller: controller.userNameOrMailController,
//                 textInputAction: TextInputAction.next,
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 10.0),
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//               width: size.width * 0.8,
//               height: 60.0,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 238, 181, 88),
//                   borderRadius: BorderRadius.circular(29)),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   suffixIcon: Icon(Icons.lock),
//                   labelText: 'Password',
//                   border: InputBorder.none,
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 controller: controller.passwordControler,
//                 textInputAction: TextInputAction.next,
//               ),
//             ),
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
//                 onPressed:() {
//                   _onTap();
//                 },
//                 child: const Text(
//                   "LOGIN",
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
//                 "Don't have an Account ?",
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
//                         return SignupPage();
//                       },
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   " Sign Up",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 14, 17, 43),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // void _onTap() {
//   //   if (controller.userNameOrMailController.text.isNotEmpty &&
//   //       controller.passwordControler.text.isNotEmpty) {
//   //     LoginController(Get.find()).callingLoginService(
//   //         controller.userNameOrMailController.text,
//   //         controller.passwordControler.text);
//   //   } else {
//   //     Get.snackbar("Error!", "Empty Places",
//   //         icon: const Icon(Icons.error_outline_outlined, color: Colors.red),
//   //         colorText: Colors.amber,
//   //         backgroundColor: Colors.amberAccent,
//   //         duration: const Duration(seconds: 3),
//   //         titleText: const Text(
//   //           "Error!",
//   //           style: TextStyle(fontSize: 20),
//   //         ));
//   //   }
//   // }
  
// }

