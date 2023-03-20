import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';
import '../BottomNavigationBar/BottomNavigationBar.dart';
import '../uploadphoto/uploadphotocontroller.dart';

class uploadpreview extends StatelessWidget {
  uploadpreview ({Key? key}) : super(key: key);
  uploadphotocontroller imagecontroller =Get.put(uploadphotocontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fill in your bio to get started', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('This data will be displayed in your account profile for security', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
              SizedBox(height: 60.h,),
               Center(
                 child: Container(
                   height: 200.h,
                   width: double.infinity,
                   child:imagecontroller.imgPath != null?Image.file(File(imagecontroller.imgPath!), fit: BoxFit.cover,):Image.asset('assets/images/profilerectangle-removebg-preview.png'),
                 )
               ),
              SizedBox(height: 80.h,),
              ExtractedButton(onpressed: () {
                Get.to(nav());
              },
                text: 'Next',),
            ],
          ),
        ),
      ),
    );
  }
}