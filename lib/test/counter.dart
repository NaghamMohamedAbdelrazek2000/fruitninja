import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Product {
  String name;
  RxInt quantity;

  Product({required this.name, required this.quantity});
}

class ProductController extends GetxController {
  var products = <Product>[
    Product(name: 'Product 1', quantity: 0.obs),
    Product(name: 'Product 2', quantity: 0.obs),
    Product(name: 'Product 3', quantity: 0.obs),
  ].obs;

  void incrementQuantity(int index) {
    products[index].quantity.value++;
  }

  void decrementQuantity(int index) {
    if (products[index].quantity.value > 0) {
      products[index].quantity.value--;
    }
  }
}

class MyListView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Product Quantity Demo'),
    ),body:
    Obx(() => ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return ListTile(
          title: Text(product.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  controller.decrementQuantity(index);
                },
              ),
             Obx(() =>  Text(product.quantity.value.toString()),),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  controller.incrementQuantity(index);
                },
              ),
            ],
          ),
        );
      },
    )));
  }
}
