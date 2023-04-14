import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/shoppingcart/SetLocationOnMap.dart';
import 'package:foodninja/Screens/shoppingcart/payment.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';

class YourOrder extends StatelessWidget {
  const YourOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Order', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 20.h,),
              Slidable(
                endActionPane:ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction( icon: Icons.delete,backgroundColor: Colors.orange, onPressed: (BuildContext context) {  },)
                  ],
                ),
                child: Stack(
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
                              child: Image.asset('assets/images/Spacy fresh crab.png',  width: 80.w,
                                  height: 150.h,
                                  fit:BoxFit.fill )),
                          SizedBox(width: 10.w,),
                          Column(
                            children: [
                              Text('Spacy fresh crab', style: TextStyle(
                                fontWeight: FontWeight.bold, color: blackcolor,
                              ),),
                              SizedBox(height: 5.h,),
                              Text('Waroenk kita', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                              SizedBox(height: 5.h,),
                              Text('\$ 35', style: TextStyle(
                                fontWeight: FontWeight.bold, color: greencolor,
                              ),),
                            ],
                          ),
                          SizedBox(width: 40.w,),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: greencolor,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child:InkWell(onTap: (){},child:Text('Process', style: TextStyle(color: Colors.white),),),
                                ),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],

                ),
              ),
              SizedBox(height: 20.h,),
              Slidable(
                endActionPane:ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction( icon: Icons.delete,backgroundColor: Colors.orange, onPressed: (BuildContext context) {  },)
                  ],
                ),
                child: Stack(
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
                              child: Image.asset('assets/images/Spacy fresh crab2.png',  width: 80.w,
                                  height: 150.h,
                                  fit:BoxFit.fill )),
                          SizedBox(width: 10.w,),
                          Column(
                            children: [
                              Text('Spacy fresh crab', style: TextStyle(
                                fontWeight: FontWeight.bold, color: blackcolor,
                              ),),
                              SizedBox(height: 5.h,),
                              Text('Waroenk kita', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                              SizedBox(height: 5.h,),
                              Text('\$ 35', style: TextStyle(
                                fontWeight: FontWeight.bold, color: greencolor,
                              ),),
                            ],
                          ),
                          SizedBox(width: 40.w,),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: greencolor,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child:InkWell(onTap: (){},child:Text('Process', style: TextStyle(color: Colors.white),),),
                                ),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],

                ),
              ),
              SizedBox(height: 20.h,),
              Slidable(
                endActionPane:ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction( icon: Icons.delete,backgroundColor: Colors.orange, onPressed: (BuildContext context) {  },)
                  ],
                ),
                child: Stack(
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
                              child: Image.asset('assets/images/Spacy fresh crab3.png',  width: 80.w,
                                  height: 150.h,
                                  fit:BoxFit.fill )),
                          SizedBox(width: 10.w,),
                          Column(
                            children: [
                              Text('Spacy fresh crab', style: TextStyle(
                                fontWeight: FontWeight.bold, color: blackcolor,
                              ),),
                              SizedBox(height: 5.h,),
                              Text('Waroenk kita', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,
                              ),),
                              SizedBox(height: 5.h,),
                              Text('\$ 35', style: TextStyle(
                                fontWeight: FontWeight.bold, color: greencolor,
                              ),),
                            ],
                          ),
                          SizedBox(width: 40.w,),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: greencolor,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child:InkWell(onTap: (){},child:Text('Process', style: TextStyle(color: Colors.white),),),
                                ),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],

                ),
              ),
              SizedBox(height: 10.h,),
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
                              SizedBox(width: 160.w,),
                              Text('120 \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text('Delivery Charge', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 130.w,),
                              Text('10 \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text('Discount', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 175.w,),
                              Text('20 \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),
                            ],
                          ),
                          Divider(color: Colors.white,),
                          Row(
                            children: [
                              Text('Total', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 190.w,),
                              Text('150 \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 40.w),
                            child: MaterialButton(
                              onPressed:(){Get.offAll(payment());},
                              child: Text('Check out',
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
