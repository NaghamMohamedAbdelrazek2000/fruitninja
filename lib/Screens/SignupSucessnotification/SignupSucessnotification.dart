import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/verificationCode/verificationCode.dart';
import 'package:foodninja/components/Button/button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SignupSucessnotification extends StatelessWidget {
  const SignupSucessnotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:Lottie.asset('assets/animation/69021-success-interaction.json'),
            ),
            Text('Congrats!', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: greencolor),),
            SizedBox(height: 15.h,),
            Text('Your Profile Is Ready To Use', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
            SizedBox(height: 100.h,),
            ExtractedButton(onpressed: () {
              Get.to(verificationCode());
            },
              text: 'Try Order',),
          ],
        ),
      ),
    );
  }
}
