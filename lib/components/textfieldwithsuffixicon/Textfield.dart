import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextformField2 extends StatelessWidget {
  TextformField2 ({
    Key? key, required this.controller,
     required this.text, required this.icon, required this.textinputtype,
    required this.obscureText, this.validator, this.onpressed,}) : super(key: key);
  final TextEditingController controller;
  final String text;
  final Icon icon;
  final TextInputType textinputtype;
  final bool obscureText;
  final String?Function(String?)? validator;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField( decoration: InputDecoration(
      labelText: text,
      suffix: IconButton( onPressed: onpressed, icon: icon,),
    ),
      controller: controller,
      keyboardType: textinputtype,
      obscureText: obscureText,
      validator: validator,
    );
  }
}