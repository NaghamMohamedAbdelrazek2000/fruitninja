import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../api/menuwithfilter/menuwithfilter.dart';
import '../../../model/menu/menumodel.dart';
class Exploremenuwithfiltercontroller extends GetxController {
  menuwithfilter menu = menuwithfilter();
  List products = [].obs;
  List cartlist = <menumodel>[].obs;
  var productsMap={}.obs;
  var count=1.obs;
  final MyCart='Cart';
  var searchlist=<menumodel>[].obs;
  var favorites=<menumodel>[].obs;
  var box=GetStorage();
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
  addtocart(menumodel item){
    cartlist.add(item);
  }
  removecart(menumodel item){
    cartlist.removeWhere((element) => element.id==item.id);
  }
  clearcart(){
    cartlist.clear();
  }
  double get totalprice {
    return cartlist.fold(0, (sum, item) => sum+item.price);
  }
  int get countitem{
    return cartlist.length;
  }
  ShippingFee(){
    int value=10;
    return  cartlist.length==0?0:value;
  }
  Discount(){
    return  cartlist.length==0?0:totalprice*0.2;
  }
  total(){
    return totalprice+ShippingFee()+Discount();
  }
  // void increment(){
  //   if(count>=1 && count<20)
  //     count.value++;
  // }
  // void decrement(){
  //   if(count>1)
  //     count.value--;
  // }
  }

