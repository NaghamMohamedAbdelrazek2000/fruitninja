import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/menu/menumodel.dart';
import '../../shoppingcart/Notification.dart';
import '../../shoppingcart/cart order/orderdetails.dart';
import '../../shoppingcart/productdetails/productdetail.dart';
import 'ExploremenuwithfilterController.dart';
class Exploremenuwithfilter extends StatelessWidget {
   Exploremenuwithfilter({Key? key}) : super(key: key);
   Exploremenuwithfiltercontroller menucontroller =Get.put(Exploremenuwithfiltercontroller());
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
            onTap: (){
              Get.to(orderdetails());
            },
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
                    IconButton(onPressed: (){Get.to(notification());}, icon: Icon(Icons.notifications_none_rounded, color: greencolor,)),
                  ], ),
                SizedBox(height: 10.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged:(value){

                          },
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
                                                    '${menucontroller.products[index].pic}'),
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
                                                        menucontroller.cartlist.contains(menucontroller.products[index])?IconButton(onPressed: (){menucontroller.removecart(menucontroller.products[index]);}, icon: Icon(Icons.remove_shopping_cart, color: greencolor,)): IconButton(onPressed: (){menucontroller.addtocart(menucontroller.products[index]);}, icon: Icon(Icons.add_shopping_cart, color: greencolor,)),

                                                      ],
                                                    ),),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          menucontroller.products[index].name.toString(),
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                          ),),
                                                        Text(
                                                          "\$${menucontroller.products[index].price.toString()}",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    Text(
                                                      menucontroller.products[index].description.toString(),
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    // Container(
                                                    //   width:600.w,
                                                    //   child: Text(
                                                    //     menucontroller.products[index].description.toString(),
                                                    //     style: TextStyle(
                                                    //       fontWeight: FontWeight.bold,
                                                    //     ),
                                                    //     maxLines: 6,
                                                    //     overflow: TextOverflow.ellipsis,
                                                    //   ),
                                                    // ),
                                                    SizedBox(height: 5.h,),
                                                    // Text(
                                                    //   "\$${menucontroller.products[index].price.toString()}",
                                                    //   style: TextStyle(
                                                    //     fontWeight: FontWeight.bold,
                                                    //   ),
                                                    // ),
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
