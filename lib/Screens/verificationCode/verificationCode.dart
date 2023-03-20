import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/ViaMethod/ViaMethod.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class verificationCode extends StatelessWidget {
  const verificationCode({Key? key}) : super(key: key);

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
              Text('Enter 4-digit Verification code', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('Code send to +6282045**** .This code will expired in 01:30', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
              SizedBox(height: 60.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.h,),
                child: PinCodeTextField(appContext: context,
                  controller: pinTextEditingController, length: 6,
                  cursorColor: Colors.orangeAccent,
                  cursorHeight: 13.h,
                  enableActiveFill: true,
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldWidth: 50,
                    inactiveColor: Colors.greenAccent,
                    selectedFillColor: greencolor,
                    inactiveFillColor: Colors.grey,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onChanged: (value){

                  },
                  keyboardType: TextInputType.number,
                ),),
              SizedBox(height: 230.h,),
              ExtractedButton(onpressed: () {
                Get.to(ViaMethod());
              },
                text: 'Next',),
            ],
          ),
        ),
      ),
    );
  }
}
