import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextformField extends StatelessWidget {
   TextformField({
    Key? key, required this.controller,
    required this.text, required this.icon, required this.textinputtype,
    required this.obscureText, this.validator}) : super(key: key);
  final TextEditingController controller;
  final String text;
final Icon icon;
  final TextInputType textinputtype;
  final bool obscureText;
  final String?Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField( decoration: InputDecoration(
      labelText: text,
      prefixIcon: icon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
    ),
      controller: controller,
      keyboardType: textinputtype,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
