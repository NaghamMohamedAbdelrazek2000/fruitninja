import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/menu/menumodel.dart';


class menuwithfilter {
  List<menumodel> item = [] ;
  loadProductsFromApi() async {
    try{
      var url = "https://fakestoreapi.com/products";
      var response = await http.get(Uri.parse(url));
      var data = await jsonDecode(response.body.toString());
      print('body: [${data}]');
      print(data.length);
      if (response.statusCode == 200){
        for (var i in data) {
          item.add(menumodel.fromJson(i));
          print(item.length);
        }
        return item;
      }
    }

    catch(e){
      print(e);
    } return item;

  }
  }


