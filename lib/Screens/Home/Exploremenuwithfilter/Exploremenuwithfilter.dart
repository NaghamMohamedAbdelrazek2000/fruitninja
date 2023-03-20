import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:foodninja/components/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/menu/menumodel.dart';
import '../../shoppingcart/productdetails/productdetail.dart';
import 'ExploremenuwithfilterController.dart';
class Exploremenuwithfilter extends StatelessWidget {
   Exploremenuwithfilter({Key? key}) : super(key: key);
   Exploremenuwithfiltercontroller menucontroller =Get.put(Exploremenuwithfiltercontroller());
   menumodel menu2=menumodel();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:menucontroller.loadProductsFrommenu(),
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
                              IconButton(onPressed: (){menucontroller.toggleGrid();}, icon: Icon(Icons.sort, color: greencolor,))

                     ], ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                onChanged:(searchname){
                                  menucontroller.addsearchlist(searchname);
                                } ,
                                controller: menuControllerr ,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    hintText: 'What do you want to order?',
                                    prefixIcon: Icon(Icons.search, color: Colors.orangeAccent,),
                                    suffixIcon: IconButton( onPressed: () {menucontroller.clearsearch();}, icon: Icon(Icons.clear,color: Colors.orangeAccent,),)
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
                      Obx(() {
                        if (menucontroller.showGrid.value){
    if(menucontroller.searchlist.isEmpty){
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
          itemCount: menucontroller.products.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Get.to(()=>productdetail(MenuModel:menucontroller.products[index]));
              },
              child: Container(
                height: 150.h,
                color: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 3.w,),
                margin: const EdgeInsets.only(bottom: 3),
                child: Column(
                  children: [
                    Obx(() =>
                        Container(
                          transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: (){
                              menucontroller.managefavorites(menucontroller.products[index].id);
                            },
                            icon:  menucontroller.isfavorites(menucontroller.products[index].id)?Icon(
                              Icons.favorite,color: Colors.red,
                            ):Icon(
                              Icons.favorite_outline_outlined,color: blackcolor,
                            ),
                          ),
                        ),
                    ),
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
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              menucontroller.products[index].title.toString(),
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
          itemCount: menucontroller.searchlist.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Get.to(()=>productdetail(MenuModel:menucontroller.searchlist[index]));
              },
              child: Container(
                height: 150.h,
                color: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 3.w,),
                margin: const EdgeInsets.only(bottom: 3),
                child: Column(
                  children: [
                    Obx(() =>
                        Container(
                          transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: (){
                              menucontroller.managefavorites(menucontroller.searchlist[index].id);
                            },
                            icon:  menucontroller.isfavorites(menucontroller.searchlist[index].id)?Icon(
                              Icons.favorite,color: Colors.red,
                            ):Icon(
                              Icons.favorite_outline_outlined,color: blackcolor,
                            ),
                          ),
                        ),
                    ),
                    Container(
                      height: 100.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              menucontroller.searchlist[index].image.toString()),
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
                              menucontroller.searchlist[index].title.toString(),
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
                                  "\$${menucontroller.searchlist[index].price.toString()}",
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
                                        '${menucontroller.searchlist[index].rating.rate}',
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
    if(menucontroller.searchlist.isEmpty){
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
                                  Obx(() =>    Container(
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
    else{
      return Container(
        height: 500.h,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: menucontroller.searchlist.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(()=>productdetail(MenuModel:menucontroller.searchlist[index],));
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
                                  menucontroller.searchlist[index].image.toString()),
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
                                  Obx(() =>    Container(
                                    transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      onPressed: (){ menucontroller.managefavorites(menucontroller.searchlist[index].id);},
                                      icon:  menucontroller.isfavorites(menucontroller.searchlist[index].id)?Icon(
                                        Icons.favorite,color: Colors.red,
                                      ):Icon(
                                        Icons.favorite_outline_outlined,color: blackcolor,
                                      ),
                                    ),
                                  ),),

                                  Container(
                                    width:200.w,
                                    child: Text(
                                      menucontroller.searchlist[index].title.toString(),
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
                                        "\$${menucontroller.searchlist[index].price.toString()}",
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
                                              '${menucontroller.searchlist[index].rating.rate}',
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
                     }),
                    ],),)),);

        }
        else{return Center(child: CircularProgressIndicator(color: greencolor,));};
      },
    );
  }
}
