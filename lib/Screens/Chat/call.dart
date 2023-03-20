import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Chat/Chat%20Details.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Call extends StatelessWidget {
  const Call({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/Image.png', height: 150.h,width: 150.w,),
                SizedBox(height: 20.h,),
                Text('Courtney Henry', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp),),
                SizedBox(height: 10.h,),
                Text('15.23 Min', style: TextStyle(fontSize: 20.sp, color: Colors.grey),),
                SizedBox(height: 150.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon:Icon(Icons.volume_off_rounded, color: greencolor,size: 40.sp,)),
                    SizedBox(width: 20.w,),
                    CircleAvatar(radius: 30,backgroundColor: Colors.red,child: IconButton(onPressed: () {Get.offAll(ChatDetails());}, icon: Icon(Icons.clear),),)
                  ],

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
