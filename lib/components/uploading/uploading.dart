import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class uploading extends StatelessWidget {
  uploading({
    Key? key, this.onpressed,required this.urlimage, required this.height, this.width }) : super(key: key);
  Function()? onpressed;
  String urlimage;
  int height;
  int? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      width: double.infinity,
      child: MaterialButton(
          onPressed:onpressed,
          child: Image.asset(urlimage, height: height.h,width: width?.w,)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
    );
  }
}