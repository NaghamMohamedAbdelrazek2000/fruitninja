import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../api/menuwithfilter/menuwithfilter.dart';
import '../../../model/menu/menumodel.dart';
import '../Constants/Constants.dart';
class testcontroller extends GetxController {
  menuwithfilter menu = menuwithfilter();
  List products = [].obs;
  late var cartlist = {}.obs;
  var favorites = <menumodel>[].obs;
  var box = GetStorage();

  @override
  void onInit() {
    List? store = box.read<List>('favoritelist');
    if (store != null) {
      favorites = store
          .map((e) => menumodel.fromJson(e))
          .toList()
          .obs;
    }
    loadProductsFrommenu();
  }

  managefavorites(int ProductId) async {
    var existindex = favorites.indexWhere((element) => element.id == ProductId);
    if (existindex >= 0) {
      favorites.removeAt(existindex);
      await box.remove('favoritelist');
    } else {
      favorites.add(products.firstWhere((element) => element.id == ProductId));
      await box.write('favoritelist', favorites);
    }
  }

  bool isfavorites(int ProductId) {
    return favorites.any((element) => element.id == ProductId);
  }


  loadProductsFrommenu() async {
    products = await menu.loadProductsFromApi();
    return products;
  }

 addProductToCart(menumodel addproduct) async {
    if (cartlist.containsKey(addproduct)) {
      cartlist[addproduct] += 1;
      print(subtotal);
    }
    else {
      cartlist[addproduct] = 1;
      print(subtotal);
    }
  }

  removeProductFromCart(menumodel removeproduct) {
    if (cartlist.containsKey(removeproduct)&& cartlist[removeproduct]==1) {
     cartlist.removeWhere((key, value) => key==removeproduct);
     print(subtotal);
    }
    else {
      cartlist[removeproduct] -= 1;
      print(subtotal);
    }
  }
  get subtotal=> cartlist.entries.map((e) => e.key.price*e.value).toList();
  get total=>cartlist.entries.map((e) => e.key.price*e.value).toList().reduce((value, element) => value+element).toStringAsFixed(2)+ShippingFee()+Discount();
  ShippingFee(){
    int value=10;
    return  cartlist.length==0?0:value;
  }
  Discount(){
    return  cartlist.length==0?0:subtotal*0.2;
  }
  removeoneproduct(menumodel removeoneproduct){
    cartlist.removeWhere((key, value) => key==removeoneproduct);
  }
  clearallproducts(){
cartlist.clear();
  }
  int get countitem{
    return products.length;
  }
  }

