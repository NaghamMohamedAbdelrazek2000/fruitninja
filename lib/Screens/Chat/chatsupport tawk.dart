import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import '../../components/appbar/appbar.dart';
import 'chatsupport2.dart';
class chatScreen extends StatelessWidget {
  chatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(onPressed: () {Get.to(chat()); },
          child: Icon(Icons.chat_rounded),backgroundColor: greencolor,),
        backgroundColor: Colors.white,
        body: Center(child: Text('Welcome To Live Chat Support',
          style: TextStyle(color:greencolor, fontSize:25.sp, fontWeight: FontWeight.bold),),)
    );
  }
}