import 'package:flutter/material.dart';

import 'components/login_comp/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}

