import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key, 
    required this.hintText, 
    this.icon = Icons.mail, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromARGB(255, 14, 17, 43),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}