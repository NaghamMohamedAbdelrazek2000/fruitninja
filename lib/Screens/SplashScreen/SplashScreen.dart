import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Constants/Constants.dart';
import '../Onboarding/Onboarding.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  @override
  void initState() {
    Timer(Duration(seconds: splashtime), () {
      Get.offAll(() => OnBoardingPage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: EdgeInsets.symmetric(vertical:150.h),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/Logo-removebg-preview.png',),
              SizedBox(height: 10.h,),
              Text('FoodNinja', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60.sp, color: greencolor),),
              SizedBox(height: 10.h,),
              Text('Deliever Favorite Food', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: blackcolor),),
            ],
          ),
        ),
      ),

    );
  }
}

