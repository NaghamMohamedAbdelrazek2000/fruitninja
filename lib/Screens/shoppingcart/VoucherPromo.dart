import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/shoppingcart/Notification.dart';
import 'package:foodninja/Screens/shoppingcart/payment.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VoucherPromo extends StatelessWidget {
  const VoucherPromo({Key? key}) : super(key: key);

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
              Text('Voucher Promo', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
             SizedBox(height: 20.h,),
              Stack(
                children: [
                  Container(
                    width: 330.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: greencolor,
                    ),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset('assets/images/Voucher1.png',  width: 150.w,
                                height: 140.h,
                                fit:BoxFit.fill )),
                        Column(
                          children: [
                            Text('Special Deal For October', style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                            )

                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: MaterialButton(
                                onPressed:(){},
                                child: Text('Order Now',
                                  style: TextStyle(color:greencolor,
                                    fontSize: 15.sp,),),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),],),
              SizedBox(height: 20.h,),
              Stack(
                children: [
                  Container(
                    width: 330.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                    ),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset('assets/images/voucher2.png',  width: 150.w,
                                height: 140.h,
                                fit:BoxFit.fill )),
                        Column(
                          children: [
                            Text('Special Deal For October', style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.purple,fontSize: 15.sp
                            )

                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: MaterialButton(
                                onPressed:(){},
                                child: Text('Order Now',
                                  style: TextStyle(color:blackcolor,
                                    fontSize: 15.sp,),),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),],),
              SizedBox(height: 110.h,),
              ExtractedButton(onpressed: () {Get.to(payment());}, text: 'Check out',)
            ],
          ),
        ),
      ),
    );
  }
}
