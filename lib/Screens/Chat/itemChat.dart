import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/Constants/Constants.dart';

class itemchat extends StatelessWidget {
  const itemchat({
    Key? key, required this.isSender, required this.text
  }) : super(key: key);
  final bool isSender;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: isSender? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color:isSender ? greencolor: Colors.grey,
                borderRadius: isSender ? BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft:Radius.circular(15),
                ):BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight:Radius.circular(15),
                )
            ),
            padding:EdgeInsets.all(15),
            child: Text(text, style: TextStyle(
                color: Colors.white
            ),),
          ),
        ],
      ),
      alignment: isSender?Alignment.centerRight:Alignment.centerLeft,
    );
  }
}