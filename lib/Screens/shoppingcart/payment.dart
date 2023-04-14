import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/shoppingcart/YourOrder.dart';
import 'package:foodninja/Screens/shoppingcart/editLocation.dart';
import 'package:foodninja/Screens/shoppingcart/editpayments.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';

import '../Home/Exploremenuwithfilter/ExploremenuwithfilterController.dart';

class payment extends StatelessWidget {
   payment({Key? key}) : super(key: key);
   Exploremenuwithfiltercontroller cartcontrollerr =Get.put(Exploremenuwithfiltercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Confirm Order', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
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
                          Row(
                            children: [
                              Text('Deliver To',style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                              SizedBox(width: 190.w,),
                              InkWell(onTap: (){Get.to(editLocation());}, child:Text('Edit',style: TextStyle(
                                fontWeight: FontWeight.bold, color: greencolor,
                              ),),),
                            ],
                          ),
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
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Payment Method',style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                              SizedBox(width: 140.w,),
                              InkWell(onTap: (){Get.to(editpayments());}, child:Text('Edit',style: TextStyle(
                                fontWeight: FontWeight.bold, color: greencolor,
                              ),),),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  child: Image.asset('assets/images/paypal Logo.png',  width: 70.w,
                                    height: 80.h,
                                  )),
                              SizedBox(width: 10.w),
                              Container(
                                width: 200.w,
                                child: Center(
                                  child: Text('2121 6352 8465 ****', style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.grey,
                                  ),),
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
                    height: 200.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: greencolor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 20.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Sub-Total', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 150.w,),
                              Obx(() =>   Text('${cartcontrollerr.totalprice.toStringAsFixed(2)} \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text('Delivery Charge', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 110.w,),
                              Obx(() => Text('${cartcontrollerr.ShippingFee()}      \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text('Discount', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 156.w,),
                              Obx(() => Text('${cartcontrollerr.Discount().toStringAsFixed(2)} \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),)
                            ],
                          ),
                          Divider(color: Colors.white,),
                          Row(
                            children: [
                              Text('Total', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 184.w,),
                              Obx(() =>  Text('${cartcontrollerr.total().toStringAsFixed(2)} \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 40.w),
                            child: MaterialButton(
                              onPressed:(){Get.to( editpayments());},
                              child: Text('Place My Order',
                                style: TextStyle(color: greencolor,
                                  fontSize: 15.sp,),),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),],),
            ],
          ),
        ),
      ),
    );
  }
}
