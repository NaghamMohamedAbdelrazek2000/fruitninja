import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Chat/CallRinging.dart';
import 'package:foodninja/Screens/Chat/Chat.dart';
import 'package:foodninja/Screens/Chat/itemChat.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:foodninja/components/textfieldwithsuffixicon/Textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
            Text('Chat', style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor
          ),),
          SizedBox(height: 10.h,),
          Stack(
            children: [
              Container(
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                        child: Image.asset('assets/images/Photo Profile.png',  width: 80.w,
                            height: 150.h,
                            fit:BoxFit.fill )),
                    SizedBox(width: 10.w,),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20.h,),
                            Row(
                              children: [
                                Text('Dianne Russell', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: blackcolor,
                                ),),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Text('Online', style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                ),),
                                SizedBox(width: 5.w,),
                                CircleAvatar(backgroundColor: Colors.green,
                                radius: 5,),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
SizedBox(width: 100.w,),
                    CircleAvatar(backgroundColor: Colors.greenAccent,
                        radius: 20,
                        child: IconButton(onPressed: (){Get.offAll(CallRinging());},icon: Icon(Icons.call, color: greencolor,),)),

                  ],
                ),
              ),
            ],

          ),
              SizedBox(height: 20.h,),
              itemchat(isSender: false, text: 'Just to order',),
              itemchat(isSender: true, text: 'Okay, for what level of spiciness?',),
              itemchat(isSender: false, text: 'Okay, wait a minute 👍',),
              itemchat(isSender: true, text: "Okay I'm waiting  👍",),
              SizedBox(height: 60.h,),
          Container(
            height: 40.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          child:
            TextFormField(
              decoration: InputDecoration(label: Text('Type Here...', style: TextStyle(color: greencolor),),
              suffix: IconButton( onPressed: (){}, icon:  IconButton(onPressed: (){}, icon: Icon(Icons.send, color: greencolor,))),
            ),
              controller:  chatdetailsController,
              keyboardType: TextInputType.text,
            ),


            ),

            ],
          ),
        ),
      ),
    );
  }
}
