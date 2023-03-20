import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/BottomNavigationBar/BottomNavigationBarcontroller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class nav extends StatelessWidget {
  nav ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: GetBuilder<navcontroller>(
          init: navcontroller(),
          builder: ( controller)=> CurvedNavigationBar(
              items: controller.items,
              color: greencolor,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              height: 40.h,
              index: controller.currentIndex,
              animationDuration: Duration(milliseconds: 500),
              onTap: (index) {
                controller.setState(index);
              }), ),
        body:GetBuilder<navcontroller>(builder: (controller) =>controller.screens[controller.currentIndex])
    );
  }
}