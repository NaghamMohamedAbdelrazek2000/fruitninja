import 'package:get/get.dart';

class resetpasswordcontroller extends GetxController{
  bool obscuretext=true;
  bool obscuretext2=true;
  showpassword(){
    obscuretext=!obscuretext;
 update();
  }
  showpassword2(){
    obscuretext2=!obscuretext2;
    update();
  }
}
