import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/shoppingcart/editpayments.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';

class editLocation extends StatelessWidget {
  const editLocation({Key? key}) : super(key: key);

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
              Text('Shipping', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 30.h,),
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
                          Text('Order Location',style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey,
                          ),),
                          Row(
                            children: [
                              Container(
                                  child: Image.asset('assets/images/Pin_-removebg-preview.png',  width: 40.w,
                                    height: 80.h,
                                  )),
                              SizedBox(width: 20.w),
                              Container(
                                width: 200.w,
                                child: Center(
                                  child: Text('8502 Preston Rd. Inglewood, Maine 98380', style: TextStyle(
                                    fontWeight: FontWeight.bold, color: blackcolor,
                                  ),maxLines: 2,),
                                ),
                              ),
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
                    height: 150.h,
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
                          Text('Deliver To',style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey,
                          ),),
                          Row(
                            children: [
                              Container(
                                  child: Image.asset('assets/images/Pin_-removebg-preview.png',  width: 40.w,
                                    height: 80.h,
                                  )),
                              SizedBox(width: 20.w),
                              Container(
                                width: 200.w,
                                child: Center(
                                  child: Text('4517 Washington Ave. Manchester, Kentucky 39495', style: TextStyle(
                                    fontWeight: FontWeight.bold, color: blackcolor,
                                  ),maxLines: 2,),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Center(
                            child: InkWell(onTap: (){}, child:Text('set location',style: TextStyle(
                              fontWeight: FontWeight.bold, color: greencolor,
                            ),),),
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
