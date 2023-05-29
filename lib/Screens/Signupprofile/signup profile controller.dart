import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Sharedpreference/Sharedpreference.dart';
import '../paymentmethod/paymentmethod.dart';
class signupprofile extends GetxController{
  Future signup( String? email,String? password, String? name)async {
    try {
      final response = await http.post(
        Uri.parse('http://178.128.138.57/api/auth/register/user?name=NaghamAbdelrazek&email=hossam2000@gmail.com&password=123456789&mobile=01120747447')
      );
      if (response.statusCode== 200) {
        var data=jsonDecode(response.body.toString());
        print(data);
        print(data['token']);
        await CacheHelper.saveDataToSharedPrefrence('token', data['token']).then((value) => Get.offAll(paymentmethod()));
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
}