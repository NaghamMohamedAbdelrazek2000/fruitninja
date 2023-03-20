import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';

class ExtractedButton extends StatelessWidget {
  ExtractedButton({
    Key? key,
 required this.onpressed, required this.text
  }) : super(key: key);
  final Function()? onpressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.w),
      width: double.infinity,
      child: MaterialButton(
        onPressed:onpressed,
        child: Text(text,
          style: TextStyle(color: Colors.white,
            fontSize: 20.sp,),),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greencolor,
      ),
    );
  }
}