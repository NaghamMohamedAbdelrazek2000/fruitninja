import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/LoginScreen/LoginScreen.dart';
import 'package:foodninja/Screens/Signup%20Screen/registercontroller.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/Textformfield/TextFormField.dart';
import 'package:get/get.dart';
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final formkey1 =GlobalKey<FormState>();
  final registercontroller  controller=Get.put(registercontroller ());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/Logo-removebg-preview.png',height: 67.h,width: 500.w,),
                Text('FoodNinja', style: TextStyle(fontWeight: FontWeight.bold,fontSize:25.sp, color: greencolor),),
                SizedBox(height: 5.h,),
                Text('Deliever Favorite Food', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: blackcolor),),
                SizedBox(height: 5.h,),
                Text('SignUp For Free', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: blackcolor),),
                SizedBox(height: 5.h,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child:Form(
                    key: formkey1,
                    child: Column(children: [
                      TextformField(controller: namecontroller,
                        text:'Name',
                        icon: Icon(Icons.person, color: greencolor,),
                        textinputtype: TextInputType.text,
                        obscureText: false,
                        validator:(value){
                          if(value==null || value.isEmpty) {
                            return 'PLease Enter Your Name';
                          }
                        }, ),
                      SizedBox(height: 7.h,),
                      TextformField(controller: emailcontroller1,
                        text:'Email Address',
                        icon: Icon(Icons.email, color: greencolor,),
                        textinputtype: TextInputType.text,
                        obscureText: false,
                        validator:(value){
                          if(value==null || value.isEmpty) {
                            return 'PLease Enter Your Email';
                          }
                        }, ),
                      SizedBox(height: 7.h,),
                      TextformField(controller:  passwordcontroller1,
                        text:'Password',
                        icon: Icon(Icons.lock, color: greencolor),
                        textinputtype: TextInputType.visiblePassword,
                        obscureText: true,
                        validator:(value){
                          if(value==null || value.isEmpty) {
                            return "PLease Enter Your Password";
                          }
                        },
                      )
                    ],),
                  ),

                ),
               GetBuilder<registercontroller>
                 (
                 init: registercontroller(),
                 builder: (controllerr)=>
                   RadioListTile( activeColor: greencolor,
                     title: Text("Keep Me Signed In"),
                     value: "keep Me Signed In",
                     groupValue: state,
                     onChanged: (value) {
                       controllerr.change(value);
                     },
                   ),) ,
            GetBuilder<registercontroller>
              (
              builder: (controllerr)=>RadioListTile(
                  activeColor: greencolor,
                  title: Text("Email Me About Special Pricing"),
                  value: "email Me About Special Pricing",
                  groupValue: state,
                  onChanged: (value) {
                    controller.change(value);
                  },
                ),),
                SizedBox(height: 10.h,),
                ExtractedButton(onpressed: ()async{
                  var formdata=formkey1.currentState!;
                  if (formdata.validate()) {
                    await controller.signup(emailcontroller1.text.trim(), passwordcontroller1.text.trim(), namecontroller.text.trim());
                    print('valid');
                  }
                  else{
                    print("not valid");
                  }
                },
                  text: 'Register',),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an account?",  style: TextStyle(
                      fontSize: 15.sp,
                      color: blackcolor,
                    ),),
                    SizedBox(width: 5.w,),
                    MaterialButton(
                      onPressed: () { Get.offAll(LoginScreen());},
                      child: Text("Login Now",  style: TextStyle(
                        fontSize: 15.sp,
                        color: greencolor,
                      ),),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),

      ),
    );
  }
}
