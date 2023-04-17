import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 14, 17, 43),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color.fromARGB(255, 14, 17, 43),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}