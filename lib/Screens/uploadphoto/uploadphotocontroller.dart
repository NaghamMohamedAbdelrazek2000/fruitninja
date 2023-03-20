import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Sharedpreference/Sharedpreference.dart';

class uploadphotocontroller extends GetxController{
  late File imageFile;
  String?  imgPath;
  @override
  void onInit() {
    getdata();
  }
  void pickImageFromGallery()async{
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if( pickedImage != null )
    {
      saveData(pickedImage.path.toString());   // path cache

      imageFile = File(pickedImage.path);

    }
  }
 void pickImageCamera()async{
    final pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    if( pickedImage != null )
    {
      saveData(pickedImage.path.toString());   // path cache
      imageFile = File(pickedImage.path);
    }
  }
   void saveData(String value)async{
    await CacheHelper.saveDataToSharedPrefrence('path', value);
    getdata();
  }
 void getdata()async{
   imgPath = await CacheHelper.getDataToSharedPrefrence('path');
    print('Successful');
  }

  void deleteData(value) async {
    await CacheHelper.removeData(key: 'path');
    getdata();
  }

}