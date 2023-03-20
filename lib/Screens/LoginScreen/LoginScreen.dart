import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Signup%20Screen/Signup%20Screen.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/Textformfield/TextFormField.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'LoginScreencontroller.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  LoginController authcontroller =Get.put(LoginController());
  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.0.h),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/Logo-removebg-preview.png',height: 100.h,width: 600.w,),
                  SizedBox(height: 10.h,),
                  Text('FoodNinja', style: TextStyle(fontWeight: FontWeight.bold,fontSize:25.sp, color: greencolor),),
                  SizedBox(height: 10.h,),
                  Text('Deliever Favorite Food', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: blackcolor),),
                  SizedBox(height: 15.h,),
                  Text('Login To Your Account', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: blackcolor),),
                  SizedBox(height: 10.h,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child:Form(
                      key: formkey,
                      child: Column(children: [
                        TextformField(controller: emailcontroller,
                          text:'Email Address',
                          icon: Icon(Icons.email, color: greencolor,),
                          textinputtype: TextInputType.text,
                          obscureText: false,
                          validator:(value){
                            if(value==null || value.isEmpty) {
                              return 'PLease Enter Your Email';
                            }
                          }, ),
                        SizedBox(height: 10.h,),
                        TextformField(controller:  passwordcontroller,
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
                  SizedBox(height: 15.h,),
                  Text('Or Continue With', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: blackcolor),),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      SizedBox(width: 20.w,),
                      InkWell(
                        onTap: ()async{
                           await authcontroller.signInWithFacebook();
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/facebook-3_1-removebg-preview.png',height:40.h,width:60.w),
                            Text('Facebook', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp, color: blackcolor),),
                          ],
                        ),
                      ),
                      SizedBox(width: 60.w,),
                      InkWell(
                        onTap: ()async{
                          await authcontroller.signinwithgoogle();
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/google-icon_1-removebg-preview.png',height: 35.h,width:60.w),
                            Text('Google', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp, color: blackcolor),),
                          ],
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 5.h,),
                  InkWell(
                    onTap: (){
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: greencolor,
                      ),
                    ),

                  ),
                  SizedBox(height: 10.h,),

                  ExtractedButton(onpressed: ()async{
                    var formdata=formkey.currentState!;
                    if (formdata.validate()) {
                      await authcontroller.login(emailcontroller.text.trim(), passwordcontroller.text.trim());
                      print('valid');
                    }
                    else{
                      print("not valid");
                    }
                  },
                    text: 'Login',),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account?",  style: TextStyle(
                        fontSize: 15.sp,
                        color: blackcolor,
                      ),),
                      SizedBox(width: 5.w,),
                      MaterialButton(
                        onPressed: () {
                          Get.offAll(SignupScreen());
                        },
                        child: Text("Register Now",  style: TextStyle(
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

      ),
    );
  }
}

