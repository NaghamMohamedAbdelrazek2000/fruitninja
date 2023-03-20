import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/Button/button.dart';
import '../../../components/appbar/appbar.dart';
import '../../Home/Homme/Home.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, size: 150.sp,color: blackcolor,),
            SizedBox(height: 40.h,),
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "Your Cart is ", style: TextStyle(
                  color: blackcolor, fontSize: 30.sp, fontWeight: FontWeight.bold,

                )),
                TextSpan(text: "Empty", style: TextStyle(
                  color: greencolor, fontSize: 30.sp, fontWeight: FontWeight.bold,

                )),

              ]
            )),
            SizedBox(height: 10.h,),
            Text('Add Items To Get Started', style: TextStyle(
              color: blackcolor, fontSize: 15.sp, fontWeight: FontWeight.bold,

            ) ,),
            SizedBox(height: 10.h,),
            ExtractedButton(onpressed: () {Get.offAll(Home());}, text: 'Go To Home',)


          ],
        ),
      ),
    );
  }
}
