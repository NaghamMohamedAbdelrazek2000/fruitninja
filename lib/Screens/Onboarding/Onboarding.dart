import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../Constants/Constants.dart';
import '../../Constants/Constants.dart';
import '../../Constants/Constants.dart';
import '../../Sharedpreference/Sharedpreference.dart';
import '../../components/images/Images.dart';
import '../BottomNavigationBar/BottomNavigationBar.dart';
import '../LoginScreen/LoginScreen.dart';
import '../../Constants/Constants.dart';

class OnBoardingPage extends StatelessWidget {
  var token=CacheHelper.getDataToSharedPrefrence("token");
  OnBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0.h),
        child:   IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Find your  Comfort Food here',body: 'Here You Can find a Chef or Dish For Every Taste and Color. Enjoy!',
              image: Images(image: 'assets/images/Dessert-removebg-preview.png',),),
            PageViewModel(
                title: 'Food Ninja is Where Your Comfort Food Lives',body:  "Enjoy a Fast and Smooth Food Delivery At Your DoorStep",
                image: Images(image: 'assets/images/FastFood-removebg-preview.png',)
            ),
            ],
          next: Icon(Icons.arrow_forward_rounded,color: greencolor,size: 30.sp,),
          done: Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold,color: greencolor, fontSize: 16.sp),),
          onDone: (){if(token !=null){
            Get.offAll(nav());
          }
          else{
            Get.offAll(LoginScreen());
          }},
          showSkipButton: true,
          skip: Text('Skip',
            style: TextStyle(color: greencolor, fontSize: 20.sp),),
          dotsDecorator: DotsDecorator(color: Colors.greenAccent, size: Size(15,15),
            activeColor:greencolor,
          ),
        ),
      ),
    );
  }
}