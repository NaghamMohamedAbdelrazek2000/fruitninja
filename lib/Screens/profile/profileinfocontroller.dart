
import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../model/profile/profilemodel.dart';

class profileinfocontroller extends GetxController{
  getprofile()async{
    final response= await http.get(Uri.parse('http://178.128.138.57/api/auth/profile/1')).then((value) {
      print('Successful');
    });
    if(response.statusCode==404){
      print(response.body);
      return  ProfileModel.fromJson(jsonDecode(response.body));
    }
  }
}
