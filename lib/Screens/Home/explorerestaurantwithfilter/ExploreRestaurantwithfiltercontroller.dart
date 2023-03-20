import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Constants/Constants.dart';
import '../../../api/restaurantwithfilter/restaurantwithfilter.dart';
import '../../../model/menu/menumodel.dart';


class ExploreRestaurantwithfiltercontroller extends GetxController{
  Restaurantwithfilter restaurant =Restaurantwithfilter();
  List products = [].obs ;
  List searchlist=<menumodel>[].obs;
  var showGrid = false.obs;
  @override
  void onInit(){
    loadProductsFromrestaurant();
  }


  toggleGrid() {
    showGrid(!showGrid.value);
  }
  loadProductsFromrestaurant() async {
    products = await restaurant.loadProductsFromApi2();
    return products;
  }
  addsearchlist(String searchname){
    searchname=searchname.toLowerCase();
    searchlist=products.where((search) {
      var searchtitle=search.title?.toLowerCase();
      return searchtitle!.contains(searchname);
    }).toList();

  }
  clearsearch(){
    restaurantControllerr.clear();
    addsearchlist('');
  }


}
