import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Screens/shoppingcart/payment.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Constants.dart';
import '../../components/appbar/appbar.dart';
import 'FinishOrder.dart';

class Trackorder extends StatelessWidget {
  const Trackorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: (){},
        child:Stack(
          children: [
            Container(
              height: 180.h,
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
                    Text('Track Orders',style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black,
                    ),),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: Image.asset('assets/images/Photo Profile.png',  width: 80.w,
                                height: 50.h,
                                fit:BoxFit.fill )),
                        SizedBox(width: 10.w,),
                       Column(
                         children: [
                           Text('Mr Kemplas', style: TextStyle(
                             fontWeight: FontWeight.bold, color: blackcolor,
                           ),),
                           SizedBox(height: 10.h,),
                           Row(
                             children: [
                               Icon(Icons.check_circle, color: greencolor,),
                               SizedBox(width: 10.w,),
                               Text('25 minutes on the way', style: TextStyle(
                                 fontWeight: FontWeight.bold, color: Colors.black,
                               ),),
                             ],
                           ),
                         ],
                       )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: MaterialButton(
                        onPressed:(){Get.to(FinishOrder());},
                        child: Text('Click Next When Arrived',
                          style: TextStyle(color: Colors.white,
                            fontSize: 15.sp,),),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greencolor,
                      ),
                    ),

                  ],
                ),
              )),
                    ],),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/Maps Image.png'),
          ],
        ),
      ),
    );
  }
}
