import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/paymentmethod/paymentmethod.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/Textformfield/TextFormField.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
class Signupprofile extends StatelessWidget {
  Signupprofile({Key? key,required this.name,required this.email,required this.password,required this.mobile}) : super(key: key);
  final formkey2 =GlobalKey<FormState>();


  String  name='';
  String  password='';
  String email='';
  String mobile='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: CustomAppBar(onpressed: (){
          Get.back();
        },),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fill in your bio to get started', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('This data will be displayed in your account profile for security', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
          SizedBox(height: 15.h,),
          Form(
            key: formkey2,
            child: Column(children: [
              TextformField(controller: name2controller,
                text:'Name',
                icon: Icon(Icons.person, color: greencolor,),
                textinputtype: TextInputType.text,
                obscureText: false,
                validator:(value){
                  if(value==null || value.isEmpty) {
                    return 'PLease Enter Your First Name';
                  }
                }, ),
              SizedBox(height: 15.h,),
              TextformField(controller: email2controller,
                text:'Email  $email',
                icon: Icon(Icons.email, color: greencolor,),
                textinputtype: TextInputType.text,
                obscureText: false,
                validator:(value){
                  if(value==null || value.isEmpty) {
                    return 'PLease Enter Your Last Name';
                  }
                }, ),
              SizedBox(height: 15.h,),
              TextformField(controller: phonenumbercontroller,
                text:'Phone Number $name  ',
                icon: Icon(Icons.phone_android_outlined, color: greencolor),
                textinputtype: TextInputType.number,
                obscureText: true,
                validator:(value){
                  if(value==null || value.isEmpty) {
                    return "PLease Enter Your Phone Number";
                  }
                },
              ),
              SizedBox(height: 90.h,),
              ExtractedButton(onpressed: () {
                var formdata=formkey2.currentState!;
                if (formdata.validate()) {
                  Get.to(paymentmethod());
                  print('valid');
                }
                else{
                  print("not valid");
                }
              },
                text: 'Next',),
            ],),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
