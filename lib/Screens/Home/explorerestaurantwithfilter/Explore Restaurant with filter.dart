import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import '../../../model/Restaurant.dart';
import '../../../model/menu/menumodel.dart';
import '../../shoppingcart/Notification.dart';
import '../../shoppingcart/restaurantdetails.dart';
import 'ExploreRestaurantwithfiltercontroller.dart';
class ExploreRestaurantwithfilter extends StatelessWidget {
ExploreRestaurantwithfilter({Key? key}) : super(key: key);
ExploreRestaurantwithfiltercontroller restaurantcontroller =Get.put(ExploreRestaurantwithfiltercontroller());
Restaurant  restaurant= Restaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
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
                          controller: menuControllerr ,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'What do you want to order?',
                              prefixIcon: Icon(Icons.search, color: Colors.orangeAccent,),
                              suffixIcon: IconButton( onPressed: () {restaurantcontroller.clearsearch();}, icon: Icon(Icons.clear,color: Colors.orangeAccent,),)
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
                    future:restaurantcontroller.loadProductsFromrestaurant(),
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
                                    Get.to(()=>restaurantdetails(Restaurant2: restaurantcontroller.products[index],));
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
                                                    restaurantcontroller.products[index].pic.toString()),
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
                                                      restaurantcontroller.products[index].name.toString(),
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h,),
                                                  Text('Delivery-Time : ${restaurantcontroller.products[index].deliveryTime.toString()}'
                                                    ,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${restaurantcontroller.products[index].lat.toString()}",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.h,),
                                                      Text(
                                                        "${restaurantcontroller.products[index].long.toString()}",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
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
                        );


                      }
                      else{return Center(child: CircularProgressIndicator(color: greencolor,));
                      }})
              ],),)),);
  }
}
