import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Sucessnotification/Sucessnotification.dart';
import 'package:foodninja/Screens/resetpassword/resetpasswordcontroller.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:foodninja/components/textfieldwithsuffixicon/Textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class resetpassword extends StatelessWidget {
   resetpassword({Key? key}) : super(key: key);
   final formkey4 =GlobalKey<FormState>();

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
              Text('Reset your password here', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('Select which contact details should we use to reset your password', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
              SizedBox(height: 30.h,),
   GetBuilder<resetpasswordcontroller>(
     init: resetpasswordcontroller(),
     builder:(controller)=> Form(
        key: formkey4,
        child: Column(
          children: [
         TextformField2(controller:  passwordcontroller2,
          text:'New Password',
          icon: controller.obscuretext ?Icon(Icons.visibility, color: greencolor):Icon(Icons.visibility_off, color: Colors.grey),
          onpressed: (){
controller.showpassword();
          },
          textinputtype: TextInputType.visiblePassword,
          obscureText: controller.obscuretext,
          validator:(value){
          if(value==null || value.isEmpty) {
          return "PLease Enter Your New Password";
          }
          },
          ),

          SizedBox(height: 20.h,),
            TextformField2(controller:  passwordcontroller3,
              text:'Confirm Password',
              icon: controller.obscuretext2 ?Icon(Icons.visibility, color: greencolor):Icon(Icons.visibility_off, color: Colors.grey),
              onpressed: (){
                controller.showpassword2();
              },
              textinputtype: TextInputType.visiblePassword,
              obscureText:  controller.obscuretext2,
              validator:(value){
                if(value==null || value.isEmpty) {
                  return "PLease Enter Your New Password";
                }
              },
            ),



                ],
              ),
            ),
   ),

    SizedBox(height: 100.h,),
    ExtractedButton(onpressed: () {
      var formdata=formkey4.currentState!;
      if (formdata.validate()) {
        Get.to(Sucessnotification());
        print('valid');
      }
      else{
        print("not valid");
      }
    },
    text: 'Next',),
      ],),
    ), ));
  }
}
