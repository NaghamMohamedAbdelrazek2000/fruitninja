import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Home/nearestrestaurant.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class filter extends StatelessWidget {
  const filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(onpressed: (){
          Get.back();
        },),
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding:  EdgeInsets.symmetric( horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Find Your Favorite Food', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded, color: greencolor,size: 30.sp,))),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'What do you want to order?',
                              prefixIcon: Icon(Icons.search, color: Colors.orangeAccent,),
                              suffixIcon: IconButton( onPressed: () {  }, icon: Icon(Icons.clear,color: Colors.orangeAccent,),)
                          ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('Type', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25.sp,
                  ),),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Restaurant',style: TextStyle(
                              color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Menu',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Text('Location', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25.sp,
                  ),),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('1 Km',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('>10 Km',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('<10 Km',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Text('Food', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25.sp,
                  ),),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Cake',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Soup',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Main Course',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Appetizer',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Dessert',style: TextStyle(
                                color: Colors.deepOrange
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  ExtractedButton(onpressed: () {  }, text: 'Search',)



  ],),
  )

    ));
  }
}
