import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/shoppingcart/payment.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';

import '../../../model/menu/menumodel.dart';

class orderdetails extends StatelessWidget {
  orderdetails({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.backspace,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order details', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 20.h,),
              Container(
                height: 300.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return  Slidable(
           endActionPane:ActionPane(
            motion: const BehindMotion(),
            children: [
                SlidableAction( icon: Icons.delete,backgroundColor: Colors.orange, onPressed: (BuildContext context) {  },)
            ],
          ),
          child: Stack(
            children: [
                Column(
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
                          SizedBox(width: 5.w,),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(
                                      Icons.minimize_rounded,
                                      color: greencolor,
                                      size: 25.sp,

                                    ),
                                  ),
                                ),),
                            ],
                          ),
                          Text('1', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: greencolor,
                                ),
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 22.sp,

                                  ),
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
            ],
          ),
        );
                    }),
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
                    onPressed:(){Get.to(payment());},
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
