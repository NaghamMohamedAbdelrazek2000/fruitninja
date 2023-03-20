import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/BottomNavigationBar/BottomNavigationBar.dart';
import 'Screens/Home/Exploremenuwithfilter/Exploremenuwithfilter.dart';
import 'Screens/Signup Screen/Signup Screen.dart';
import 'Sharedpreference/Sharedpreference.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.onInit();
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignupScreen(),
        );});

  }
}