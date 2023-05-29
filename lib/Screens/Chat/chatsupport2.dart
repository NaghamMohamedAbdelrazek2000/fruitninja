import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/appbar/appbar.dart';
class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      body: Tawk(
        directChatLink:'https://tawk.to/chat/641a2fad4247f20fefe74185/1gs34kg4p',
        visitor: TawkVisitor(
          name: 'Hana Mohamed',
          email: 'Hana@gmail.com',
        ),
        onLoad: () {
          print('Hello');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: Center(
            child: CircularProgressIndicator(color:greencolor,)
        ),
      ),
    );
  }
}
