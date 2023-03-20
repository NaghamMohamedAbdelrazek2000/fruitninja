import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/uploadphoto/uploadphoto.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:foodninja/components/payments/payments.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class paymentmethod extends StatelessWidget {
  paymentmethod({Key? key}) : super(key: key);
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
              SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              children: [
                Payments(
                  onpressed: (){

                }, urlimage: 'assets/images/paypal Logo.png',
                ),
                Divider(color: greencolor,thickness: 1.5),
                Payments(
                  onpressed: (){

                  }, urlimage: 'assets/images/visa logo.png',
                ),
                Divider(color: greencolor,thickness: 1.5,),
                Payments(
                  onpressed: (){

                  }, urlimage: 'assets/images/Payoneer_logo-removebg-preview.png',
                ),
              ],
            ),
          ),

              SizedBox(height: 20.h,),
              ExtractedButton(onpressed: () {
Get.to(uploadphoto());
              },
                text: 'Next',),
            ],
          ),
        ),
      ),
    );
  }
}

