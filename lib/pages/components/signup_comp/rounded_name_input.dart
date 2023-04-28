import 'package:flutter/material.dart';
import 'package:take_me_out/pages/components/text_field_container.dart';

class RoundedNameInputField extends StatelessWidget {
  final String hintText;
  //final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedNameInputField({
    Key? key, 
    required this.hintText, 
    //this.icon = Icons.person, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          // icon: Icon(
          //   icon,
          //   color: const Color.fromARGB(255, 14, 17, 43),
          // ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}