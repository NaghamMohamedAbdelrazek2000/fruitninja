import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Home/upload2/uploadphotocontroller.dart';
import 'package:foodninja/Screens/uploadphoto/uploadphotocontroller.dart';
import 'package:foodninja/Screens/uploadpreview/uploadpreview.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:foodninja/components/uploading/uploading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../BottomNavigationBar/BottomNavigationBar.dart';

class uploadphoto2 extends StatelessWidget {
  uploadphoto2 ({Key? key}) : super(key: key);
  uploadphotocontroller2 imagecontroller =Get.put(uploadphotocontroller2());
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
              Text('Fill in your bio to get started', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 15.h,),
              Text('This data will be displayed in your account profile for security', style: TextStyle(fontSize: 15.sp, color: blackcolor),),
             SizedBox(height: 50.h,),
              uploading(urlimage: 'assets/images/Gallery_Icon-removebg-preview.png', height: 100,onpressed: (){imagecontroller.pickImageFromGallery();
                },),
              SizedBox(height: 20.h,),
              uploading(urlimage: 'assets/images/camera-removebg-preview.png', height: 200,onpressed: (){imagecontroller.pickImageCamera();},),
              SizedBox(height: 5.h,),
              ExtractedButton(onpressed: () {
                Get.to(nav());
              },
                text: 'Next',),
            ],
          ),
        ),
      ),
    );
  }
}