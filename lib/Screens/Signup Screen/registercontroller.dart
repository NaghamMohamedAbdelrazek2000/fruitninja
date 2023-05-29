import 'dart:convert';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Sharedpreference/Sharedpreference.dart';
import '../BottomNavigationBar/BottomNavigationBar.dart';
import '../LoginScreen/LoginScreen.dart';
import '../Signupprofile/Signupprofile.dart';
class registercontroller extends GetxController{
  Future signup( String? email,String? password, String? name)async {
    try {
      final response = await http.post(
        Uri.parse('http://206.189.103.8/api/auth/register/user?name=Nagham&email=nagham80@gmail.com&password=123456789&mobile=01120747447'),
          body:{
            'email':email,
            'password':password,
          }
      );
      print(response.statusCode);
      if (response.statusCode== 200) {
        var data=jsonDecode(response.body.toString());
        print(data);
        print(data['token']);
        await CacheHelper.saveDataToSharedPrefrence('token', data['token']).then((value) => Get.offAll(LoginScreen()));
        print('Created Account successfully');


      }
      else {
        print('Failed');
        Get.back();
      }
    } catch (e) {
      print(e.toString());
    }
  }
  change(value){
    state=value.toString();
    update();
  }
}