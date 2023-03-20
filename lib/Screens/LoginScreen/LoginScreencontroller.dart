import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:foodninja/Screens/LoginScreen/LoginScreen.dart';
import 'package:foodninja/services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Sharedpreference/Sharedpreference.dart';
import '../BottomNavigationBar/BottomNavigationBar.dart';
class LoginController extends GetxController{
  Services services= Services();
  Future login( String? email,String? password)async {
    try {
      final response = await http.post(
          Uri.parse('http://178.128.138.57/api/auth/login?password=123456789&email=naghamafifi2000@gmail.com')
          , //string is not asubtype of URI
          // body: {
          //   'email': email,
          //   'password': password,
          // }
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        await CacheHelper.saveDataToSharedPrefrence('token', data['token']) .then((value) => Get.offAll(nav()));;

        print('Login successfully');

      }
      else {
        print('Failed');
        Get.back();
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future logout()async{
    await CacheHelper.removeData(key: 'token').then((value) async=>  await CacheHelper.clearData()).then((value) => Get.offAll(LoginScreen()));;
  }
 Future signinwithgoogle()async {
    final signinaccount= await services.googleSignin.signIn();
   final signinauth=await signinaccount?.authentication;
    AuthCredential authcredential=GoogleAuthProvider.credential(idToken: signinauth?.idToken,accessToken: signinauth?.accessToken);
    final res=await services.auth.signInWithCredential(authcredential);
     User? user= res.user;
print('user email=${user?.email}');
    await CacheHelper.saveDataToSharedPrefrence("token", user!.uid).then((value) => Get.offAll(nav()));
  }
  Future signoutwithgoogle()async{
    await services.googleSignin.signOut().then((value) async=> await CacheHelper.removeData(key: 'token')).then((value) async=>  await CacheHelper.clearData()).then((value) => Get.offAll(LoginScreen()));

  }
  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await services.facebookSignin.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final res=await services.auth.signInWithCredential(facebookAuthCredential);
    User? user= res.user;
    print('user email=${user?.email}');
    await CacheHelper.saveDataToSharedPrefrence("token", user!.uid).then((value) => Get.offAll(nav()));
  }
  Future  signoutwithfacebbok()async{
    await services.facebookSignin.logOut().then((value) async=> await CacheHelper.removeData(key: 'token')).then((value) async=>  await CacheHelper.clearData()).then((value) => Get.offAll(LoginScreen()));;
  }



}