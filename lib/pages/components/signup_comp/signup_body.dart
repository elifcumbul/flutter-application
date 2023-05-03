import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/signup_comp/signup_background.dart';
import 'package:take_me_out/pages/login_page.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {

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
                onSaved: (newValue) {
                  
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
                onSaved: (newValue) {
                  
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
                onSaved: (newValue) {
                  
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
                onSaved: (newValue) {
                  
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
                onSaved: (newValue) {
                  
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
