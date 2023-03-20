import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/resetpassword/ResetPassword.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViaMethod extends StatelessWidget {
  const ViaMethod({Key? key}) : super(key: key);

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
              Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('Select which contact details should we use to reset your password', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
              SizedBox(height: 60.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: MaterialButton(
                    onPressed:(){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.sms, color: greencolor,size: 30,),
                      SizedBox(width: 20.w,),
                      Text('Via Sms', style: TextStyle(fontSize: 25.sp, color: blackcolor),),
                    ],)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: MaterialButton(
                    onPressed:(){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email, color: greencolor,size: 30,),
                        SizedBox(width: 20.w,),
                        Text('Via Email', style: TextStyle(fontSize: 25.sp, color: blackcolor),),
                      ],)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(height: 200.h,),
              ExtractedButton(onpressed: () {
                Get.to(resetpassword());
              },
                text: 'Next',),
            ],
          ),
        ),
      ),
    );
  }
}
