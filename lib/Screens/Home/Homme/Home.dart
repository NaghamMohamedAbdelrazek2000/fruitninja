import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/Screens/Home/filter.dart';
import 'package:foodninja/Screens/Home/nearestrestaurant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../shoppingcart/Notification.dart';
import '../../shoppingcart/cart order/orderdetails.dart';
import '../../shoppingcart/productdetails/productdetail.dart';
import '../../shoppingcart/restaurantdetails.dart';
import '../Exploremenuwithfilter/Exploremenuwithfilter.dart';
import '../Exploremenuwithfilter/ExploremenuwithfilterController.dart';
import '../explorerestaurantwithfilter/Explore Restaurant with filter.dart';
import '../explorerestaurantwithfilter/ExploreRestaurantwithfiltercontroller.dart';
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  Exploremenuwithfiltercontroller menucontroller =Get.put(Exploremenuwithfiltercontroller());
  ExploreRestaurantwithfiltercontroller restaurantcontroller =Get.put(ExploreRestaurantwithfiltercontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Find Your Favorite Food', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: IconButton(onPressed: (){Get.to(notification());}, icon: Icon(Icons.notifications_none_rounded, color: greencolor,size: 30.sp,))),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller:HomeControllerr,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'What do you want to order?',
                              prefixIcon: Icon(Icons.search, color: Colors.orangeAccent,),
                              suffixIcon: IconButton( onPressed: () { }, icon: Icon(Icons.clear,color: Colors.orangeAccent,),)
                          ),),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.yellow,
                          ),
                          child: IconButton(onPressed: (){Get.to(filter()); }, icon: Icon(Icons.filter_list, color: Colors.deepOrange,)))
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Stack(
                  children: [
                Container(
                 width: 330.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: greencolor,
            ),
            child: Row(
              children: [
                Container(
                    child: Image.asset('assets/images/Image-removebg-preview.png',  width: 165.w,
                        height: 150.h,
                        fit:BoxFit.fill )),
            Column(
              children: [
                Text('Special Deal For October', style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,
                            )

                        ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: MaterialButton(
                onPressed:(){},
                child: Text('Buy Now',
                  style: TextStyle(color:greencolor,
                    fontSize: 15.sp,),),),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
              ],
            ),


              ],
            ),
                ),],),
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0.h),
                  child: Row(
                    children: [
                      Text('Nearest Restaurant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                      SizedBox(width:60.w,),
                      MaterialButton(
                        onPressed:(){},
                        child: Text('View More',
                          style: TextStyle(color:Colors.orange,
                            ),),),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
               nearestrestaurant(),
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0.h),
                    child: Row(
                      children: [
                        Text('Popular Menu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                        SizedBox(width: 100.w,),
                        MaterialButton(
                          onPressed:(){Get.to(Exploremenuwithfilter());},
                          child: Text('View More',
                            style: TextStyle(color:Colors.orange,
                            ),),),
                      ],
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                  child: FutureBuilder(
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
                                                          menucontroller.cartlist.contains(menucontroller.products[index])?IconButton(onPressed: (){menucontroller.removecart(menucontroller.products[index]);}, icon: Icon(Icons.remove_shopping_cart, color: greencolor,)): IconButton(onPressed: (){menucontroller.addtocart(menucontroller.products[index]);}, icon: Icon(Icons.add_shopping_cart, color: greencolor,)),

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
                                                          Text(
                                                            "\$${menucontroller.products[index].price.toString()}",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
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
                        }}),
                ),
                SizedBox(height: 20.h,),
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0.h),
                    child: MaterialButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Text('Popular Restaurant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                          SizedBox(width:30.w,),
                          MaterialButton(
                            onPressed:(){Get.to(ExploreRestaurantwithfilter());},
                            child: Text('View More',
                              style: TextStyle(color:Colors.orange,
                              ),),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                  child: FutureBuilder(  future: restaurantcontroller.loadProductsFromrestaurant(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
      return Container(
          height: 500.h,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: restaurantcontroller.products.length,
              itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(()=>restaurantdetails(Menumodel2: restaurantcontroller.products[index],));
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
                                      restaurantcontroller.products[index].image.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:200.w,
                                      child: Text(
                                        restaurantcontroller.products[index].title.toString(),
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
                                        Text(
                                          "\$${restaurantcontroller.products[index].price.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
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
                                                '${restaurantcontroller.products[index].rating.rate}',
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
                            )
                          ],
                        ),
                      ),
                    ),
                  );
              }),
        );}

    else{return Center(child: CircularProgressIndicator(color: greencolor));}}),
                ),

          ]
                )

          ),
            ),
          ),
        );

  }
}

