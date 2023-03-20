import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payments extends StatelessWidget {
  Payments({
    Key? key, this.onpressed,required this.urlimage }) : super(key: key);
Function()? onpressed;
String urlimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      width: double.infinity,
      child: MaterialButton(
          onPressed:onpressed,
          child: Image.asset(urlimage,  width: 130.w,
            height: 80.h,)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
    );
  }
}