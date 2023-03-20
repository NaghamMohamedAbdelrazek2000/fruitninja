import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/SignupSucessnotification/SignupSucessnotification.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class setlocation extends StatelessWidget {
  const setlocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Set Your Location', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('This data will be displayed in your account profile for security', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
              SizedBox(height: 80.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Pin_-removebg-preview.png',width: 60.w,),
                  SizedBox(width: 20.w,),
                  Text('Your Location', style: TextStyle(fontSize: 20.sp, color: blackcolor, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 50.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: MaterialButton(
                  onPressed:(){},
                  child: Text('Set Location',
                    style: TextStyle(color: Colors.white,
                      fontSize: 20.sp,),),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 150.h,),
              ExtractedButton(onpressed: () {
                Get.to(SignupSucessnotification());
              },
                text: 'Next',),
            ],
          ),
        ),
      ) ,
    );
  }
}
