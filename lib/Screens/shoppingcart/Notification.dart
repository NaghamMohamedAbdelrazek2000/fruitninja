import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

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
                Text('Notification', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
                SizedBox(height: 30.h,),
                Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset('assets/images/checked (1) 1.png',  width: 80.w,
                                  height: 150.h,
                                  fit:BoxFit.fill )),
                          SizedBox(width: 10.w,),
                          Column(
                            children: [
                              SizedBox(height: 20.h,),
                              Container(
                                width: 200.w,
                                child: Text('Your order has been taken by the driver', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: blackcolor,
                                ),maxLines: 2,),
                              ),
                              SizedBox(height: 10.h,),
                              Text('Recently', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 30.h,),
                Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset('assets/images/money 1.png',  width: 80.w,
                                  height: 150.h,
                                  fit:BoxFit.fill )),
                          SizedBox(width: 10.w,),
                          Column(
                            children: [
                              SizedBox(height: 20.h,),
                              Text('Topup for \$100 was successful', style: TextStyle(
                                fontWeight: FontWeight.bold, color: blackcolor,
                              ),),
                              SizedBox(height: 10.h,),
                              Text('10.00 Am', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ],),
                SizedBox(height: 30.h,),
                Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset('assets/images/x-button 1.png',  width: 80.w,
                                  height: 150.h,
                                  fit:BoxFit.fill )),
                          SizedBox(width: 10.w,),
                          Column(
                            children: [
                              SizedBox(height: 20.h,),
                              Text('Your order has been canceled', style: TextStyle(
                                fontWeight: FontWeight.bold, color: blackcolor,
                              ),),
                              SizedBox(height: 10.h,),
                              Text('22 Juny 2021', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ],

                ),

              ],
            ),
          ),
        )

    );
  }
}
