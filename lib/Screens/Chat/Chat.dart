import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Chat/Chat%20Details.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 5.w),
            child: Column(
              children: [
                Text('Chat', style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor
                ),),
                SizedBox(height: 40.h,),
                Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: MaterialButton(
                        onPressed: (){ Get.to(ChatDetails());},
                        child: Row(
                          children: [
                            Container(
                                child: Image.asset('assets/images/Photo Profile.png',  width: 80.w,
                                    height: 150.h,
                                    fit:BoxFit.fill )),
                            SizedBox(width: 10.w,),
                            Column(
                              children: [
                                SizedBox(height: 20.h,),
                                Text('Anamwp', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: blackcolor,
                                ),),
                                SizedBox(height: 10.h,),
                                Text('Your Order Just Arrived!', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                ),),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 20.h,),
                Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: MaterialButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Container(
                                child: Image.asset('assets/images/Photo Profile2.png',  width: 80.w,
                                    height: 150.h,
                                    fit:BoxFit.fill )),
                            SizedBox(width: 10.w,),
                            Column(
                              children: [
                                SizedBox(height: 20.h,),
                                Text('Guy Hawkins', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: blackcolor,
                                ),),
                                SizedBox(height: 10.h,),
                                Text('Your Order Just Arrived!', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                ),),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 20.h,),
                Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: MaterialButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Container(
                                child: Image.asset('assets/images/Photo Profile3.png',  width: 80.w,
                                    height: 150.h,
                                    fit:BoxFit.fill )),
                            SizedBox(width: 10.w,),
                            Column(
                              children: [
                                SizedBox(height: 20.h,),
                                Text('Leslie Alexander', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: blackcolor,
                                ),),
                                SizedBox(height: 10.h,),
                                Text('Your Order Just Arrived!', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                ),),
                              ],
                            ),


                          ],
                        ),
                      ),
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
