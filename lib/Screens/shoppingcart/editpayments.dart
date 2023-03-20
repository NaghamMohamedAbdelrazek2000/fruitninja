import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';


class editpayments extends StatelessWidget {
  const editpayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 20.h,),
              Stack(
                children: [
                  Container(
                    height: 120.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Container(
                                    child: Image.asset('assets/images/paypal Logo.png',  width: 90.w,
                                      height: 80.h,
                                    )),
                                SizedBox(width: 40.w,),
                                Text('2121 6352 8465 ****', style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
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
                    height: 120.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white24,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Container(
                                    child: Image.asset('assets/images/visa logo.png',  width: 90.w,
                                      height: 80.h,
                                    )),
                                SizedBox(width: 55.w,),
                                Text('2121 6352 8465 ****', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                ),
                                ),
                              ],
                            ),
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
                    height: 120.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white24,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Container(
                                    child: Image.asset('assets/images/Payoneer_logo-removebg-preview.png',  width: 90.w,
                                      height: 80.h,
                                    )),
                                SizedBox(width: 35.w,),
                                Text('2121 6352 8465 ****', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                ),
                                ),
                              ],
                            ),
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
    );
  }
}
