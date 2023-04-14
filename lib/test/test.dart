import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/test/test2cart.dart';
import 'package:foodninja/test/testcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/menu/menumodel.dart';
import '../Screens/shoppingcart/cart order/orderdetails.dart';
import '../Screens/shoppingcart/productdetails/productdetail.dart';
class test extends StatelessWidget {
  test ({Key? key}) : super(key: key);
  testcontroller  menucontroller =Get.put(testcontroller());
  menumodel menu2=menumodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading:  IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
            ),
          ),
          actions:[
            InkWell(
              onTap: (){Get.to(test2cart());},
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.orange,),
                  ],
                ),
              ),
            )
          ]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Find Your Favorite Food', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded, color: greencolor,)),
                  ], ),
                SizedBox(height: 10.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: menuControllerr ,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'What do you want to order?',
                              prefixIcon: Icon(Icons.search, color: Colors.orangeAccent,),
                              suffixIcon: IconButton( onPressed: () {}, icon: Icon(Icons.clear,color: Colors.orangeAccent,),)
                          ),),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.yellow,
                          ),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_list, color: Colors.deepOrange,)))
                    ],
                  ),
                ),
                SizedBox(height:15.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.0.h),
                  child: Text('Popular Menu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                ),
                SizedBox(height: 10.h,),
                FutureBuilder(
                    future:menucontroller.loadProductsFrommenu(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 500.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: menucontroller.products.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    Get.to(()=>productdetail(MenuModel:menucontroller.products[index],));
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    child: Container(
                                      height: 120.h,
                                      color: Colors.grey,
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 100.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    menucontroller.products[index].image.toString()),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                                              child: Padding(
                                                padding:  EdgeInsets.only(bottom: 8.0, left: 15, right: 15,),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Obx(() =>  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                                                          alignment: Alignment.centerLeft,
                                                          child: IconButton(
                                                            onPressed: (){ menucontroller.managefavorites(menucontroller.products[index].id);},
                                                            icon:  menucontroller.isfavorites(menucontroller.products[index].id)?Icon(
                                                              Icons.favorite,color: Colors.red,
                                                            ):Icon(
                                                              Icons.favorite_outline_outlined,color: blackcolor,
                                                            ),
                                                          ),
                                                        ),
                                                        menucontroller.cartlist.containsKey(menucontroller.products[index])?IconButton(onPressed: (){menucontroller.removeProductFromCart(menucontroller.products[index]);}, icon: Icon(Icons.remove_shopping_cart, color: greencolor,)): IconButton(onPressed: (){menucontroller.addProductToCart(menucontroller.products[index]);}, icon: Icon(Icons.add_shopping_cart, color: greencolor,)),

                                                      ],
                                                    ),),

                                                    Container(
                                                      width:200.w,
                                                      child: Text(
                                                        menucontroller.products[index].title.toString(),
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Obx(()=>Text(
                                                          "\$${menucontroller.subtotal[index].toStringAsFixed(2)}",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),),
                                                        Container(
                                                          height: 20.h,
                                                          width: 45.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: greencolor
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              Text(
                                                                '${menucontroller.products[index].rating.rate}',
                                                                style: TextStyle(color: Colors.white),
                                                              ),
                                                              Icon(Icons.star, size: 13.sp,color:Colors.white ,)
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );


                      }
                      else{return Center(child: CircularProgressIndicator(color: greencolor,));
                      }})
              ],),)),);



  }
}
