import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../api/menuwithfilter/menuwithfilter.dart';
import '../../../model/menu/menumodel.dart';
import '../../Chat/Chat.dart';
import '../../profile/profileinfo.dart';
import '../../shoppingcart/FinishOrder.dart';
import '../Homme/Home.dart';
class Exploremenuwithfiltercontroller extends GetxController {
  menuwithfilter menu = menuwithfilter();
  List products = [].obs;
  var favorites=<menumodel>[].obs;
  List searchlist=<menumodel>[].obs;
  var showGrid = false.obs;
  var box=GetStorage();
  toggleGrid() {
    showGrid(!showGrid.value);
  }

  @override
  void onInit(){
    List? store = box.read<List>('favoritelist');
    if (store  != null) {
      favorites = store.map((e) =>menumodel.fromJson(e)).toList().obs;
    }
    loadProductsFrommenu();
  }
  managefavorites(int ProductId)async{
    var existindex= favorites.indexWhere((element)=> element.id==ProductId);
    if(existindex>=0){
      favorites.removeAt(existindex);
      await box.remove('favoritelist');
    } else{
      favorites.add(products.firstWhere((element) => element.id==ProductId));
      await box.write('favoritelist', favorites);
    }


  }
  bool isfavorites(int ProductId){
    return favorites.any((element) => element.id==ProductId);
  }


  loadProductsFrommenu() async {
    products = await menu.loadProductsFromApi();
    return products;
  }
  addsearchlist(String searchname){
    searchname=searchname.toLowerCase();
    searchlist=products.where((search) {
      var searchtitle=search.title?.toLowerCase();
      return searchtitle!.contains(searchname);
    }).toList();
    update();

  }
  clearsearch(){
    menuControllerr.clear();
    addsearchlist('');
  }
}