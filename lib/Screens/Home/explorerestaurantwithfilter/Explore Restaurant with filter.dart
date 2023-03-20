import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import '../../../model/menu/menumodel.dart';
import '../../profile/profileinfo.dart';
import '../../shoppingcart/restaurantdetails.dart';
import 'ExploreRestaurantwithfiltercontroller.dart';
class ExploreRestaurantwithfilter extends StatelessWidget {
ExploreRestaurantwithfilter({Key? key}) : super(key: key);
ExploreRestaurantwithfiltercontroller restaurantcontroller =Get.put(ExploreRestaurantwithfiltercontroller());
menumodel menu2=menumodel();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: restaurantcontroller.loadProductsFromrestaurant(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
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
                          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded, color: greencolor,)),
                          IconButton(onPressed: (){restaurantcontroller.toggleGrid();}, icon: Icon(Icons.sort, color: greencolor,))
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                onChanged:(searchname){
restaurantcontroller.addsearchlist(searchname);
                                } ,
                                controller: restaurantControllerr,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    hintText: 'What do you want to order?',
                                    prefixIcon: Icon(Icons.search, color: Colors.orangeAccent,),
                                    suffixIcon: IconButton( onPressed: () {restaurantcontroller.clearsearch();
                                    }, icon: Icon(Icons.clear,color: Colors.orangeAccent,),)
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
                        child: Text('Popular Restaurant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                      ),
                      SizedBox(height: 10.h,),
                      Obx(() {
                        if (restaurantcontroller.showGrid.value){
                          if(restaurantcontroller.searchlist.isEmpty){
                            return Container(
                              height: 450.h,
                              child: GridView.builder(
                                padding: EdgeInsets.only(top: 10),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 9
                                ),
                                itemCount: restaurantcontroller.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: (){
                                      Get.to(()=>restaurantdetails(Menumodel2: restaurantcontroller.products[index],));
                                    },
                                    child: Container(
                                      height: 150.h,
                                      color: Colors.grey,
                                      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 20.h),
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Column(
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
                                          SizedBox(height: 20.h),
                                          Expanded(
                                            child: Padding(
                                              padding:  EdgeInsets.all(6.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    restaurantcontroller.products[index].title.toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 15.h,),
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
                                  );
                                },
                              ),

                            );
                          }
                          else{

                            return Container(
                              height: 450.h,
                              child: GridView.builder(
                                padding: EdgeInsets.only(top: 10),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 9
                                ),
                                itemCount: restaurantcontroller.searchlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: (){
                                      Get.to(()=>restaurantdetails(Menumodel2: restaurantcontroller.searchlist[index],));
                                    },
                                    child: Container(
                                      height: 150.h,
                                      color: Colors.grey,
                                      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 20.h),
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    restaurantcontroller.searchlist[index].image.toString()),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          Expanded(
                                            child: Padding(
                                              padding:  EdgeInsets.all(6.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    restaurantcontroller.searchlist[index].title.toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 15.h,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\$${restaurantcontroller.searchlist[index].price.toString()}",
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
                                                              '${restaurantcontroller.searchlist[index].rating.rate}',
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
                                  );
                                },
                              ),

                            );
                          }
                          }
                        if(restaurantcontroller.searchlist.isEmpty){
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
                          );
                        }else{
                          return Container(
                            height: 500.h,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: restaurantcontroller.searchlist.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Get.to(()=>restaurantdetails(Menumodel2: restaurantcontroller.searchlist[index],));
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
                                                      restaurantcontroller.searchlist[index].image.toString()),
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
                                                        restaurantcontroller.searchlist[index].title.toString(),
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
                                                          "\$${restaurantcontroller.searchlist[index].price.toString()}",
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
                                                                '${restaurantcontroller.searchlist[index].rating.rate}',
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
                          );
                        }}),
                    ],),)),);

        }
        else{return Center(child: CircularProgressIndicator(color: greencolor,));};
      },
    );
  }
}
