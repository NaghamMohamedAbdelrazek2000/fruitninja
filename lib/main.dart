
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/test/test%20food%20api/test%20api.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/BottomNavigationBar/BottomNavigationBar.dart';
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
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:nav());
        });

  }
}