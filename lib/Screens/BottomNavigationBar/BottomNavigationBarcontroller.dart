import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Screens/Chat/Chat.dart';
import 'package:foodninja/Screens/Home/Homme/Home.dart';
import 'package:foodninja/Screens/profile/profileinfo.dart';
import 'package:foodninja/Screens/shoppingcart/FinishOrder.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class navcontroller extends GetxController{
  var currentIndex = 0;
  final items = [
    Icon(Icons.home, size: 30.sp,color:Colors.black54 ,),
    Icon(Icons.person, size: 30.sp,color:Colors.black54 ),
    Icon(Icons.shopping_cart, size: 30.sp,color:Colors.black54 ),
    Icon(Icons.chat_sharp, size: 30.sp,color:Colors.black54 ),
  ];
  List screens = [
    Home(),
    profileinfo(),
    FinishOrder(),
    Chat(),


  ];
  setState(index) {
    currentIndex = index;
    update();
  }

}