import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/shoppingcart/VoucherPromo.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/Textformfield/TextFormField.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../BottomNavigationBar/BottomNavigationBar.dart';
class RateRestaurant extends StatelessWidget {
  const RateRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 8.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/raterestaurant.png', height: 150.h,width: 150.w,),
                SizedBox(height: 20.h,),
                Text('Thank You!', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp),),
                SizedBox(height: 5.h,),
                Text('Enjoy Your Meal', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp),),
                SizedBox(height: 10.h,),
                Text('Please rate your Restaurant', style: TextStyle(fontSize: 20.sp, color: Colors.grey),),
                SizedBox(height: 20.h,),
                RatingBar.builder(
                    minRating: 1,
                    onRatingUpdate: (Rating){},
                    itemBuilder: (BuildContext context, int index)=>Icon(Icons.star, color: Colors.amber,)),
                SizedBox(height: 20.h,),
                TextformField(controller: raterestaurantController, text: 'Leave feedback', icon: Icon(Icons.edit_note_sharp, color: greencolor,), textinputtype: TextInputType.text, obscureText: false,),
                SizedBox(height: 60.h,),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.w),
                        width: 150.w,
                        child: MaterialButton(
                          onPressed:(){Get.to(nav());},
                          child: Text('Submit',
                            style: TextStyle(color: Colors.white,
                              fontSize: 20.sp,),),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greencolor,
                        ),
                      ),
                    ),
                    InkWell(onTap:(){Get.to(nav());},child: Text('Skip',style: TextStyle(color: greencolor,fontSize: 20.sp),))


                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
