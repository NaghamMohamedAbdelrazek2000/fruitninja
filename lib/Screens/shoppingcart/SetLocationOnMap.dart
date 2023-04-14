import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Screens/shoppingcart/trackorderwithmap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Constants.dart';

class SetLocationOnMap extends StatelessWidget {
  const SetLocationOnMap({Key? key}) : super(key: key);

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
                    Text('Your Location',style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey,
                    ),),
                    Row(
                      children: [
                        Container(
                            child: Image.asset('assets/images/Pin_-removebg-preview.png',  width: 40.w,
                              height: 80.h,
                            )),
                        SizedBox(width: 10.w),
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
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: MaterialButton(
                        onPressed:(){Get.to(Trackorder());},
                        child: Text('Set Location',
                          style: TextStyle(color: Colors.white,
                            fontSize: 15.sp,),),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greencolor,
                      ),
                    ),

                  ],
                ),
              ),
            ),],),
      ),
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
