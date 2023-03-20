import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../components/appbar/appbar.dart';
import '../../../model/menu/menumodel.dart';
import '../../Home/Exploremenuwithfilter/Exploremenuwithfilter.dart';
import '../../Home/Exploremenuwithfilter/ExploremenuwithfilterController.dart';
class productdetail extends StatelessWidget {
   productdetail({Key? key, required this.MenuModel}) : super(key: key);
   final menumodel MenuModel;
   Exploremenuwithfiltercontroller menucontroller =Get.put(Exploremenuwithfiltercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onpressed: (){
        Get.back();
      },),
      // floatingActionButton: Badge(
      //     showBadge: true,
      //     position: BadgePosition.topEnd(top: -10, end: 1),
      //     badgeAnimation: BadgeAnimation.rotation(
      //       animationDuration: Duration(milliseconds: 200),
      //       loopAnimation: false,
      //       curve: Curves.fastOutSlowIn,
      //       colorChangeAnimationCurve: Curves.easeInCubic,
      //     ),
      //     badgeStyle: BadgeStyle(
      //       shape:BadgeShape.square,
      //       badgeColor: Colors.deepOrange,
      //     ),
      //   badgeContent: Text('0',
      //     style: const TextStyle(color: Colors.white),
      //   ),
      //     child: FloatingActionButton(
      //       backgroundColor: Colors.orangeAccent,
      //       onPressed: (){},
      //       child: Icon(Icons.shopping_cart),
      //
      //     ),
      //   ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height /3,
            flexibleSpace: FlexibleSpaceBar(
              background: Positioned.fill(
                  child: Image(
                    image: NetworkImage(MenuModel.image.toString()),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child:Container(
                height: 600.h,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent,
                            ),
                            child: Center(
                              child: Text(
                                'Popular',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              height: 30.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add To Cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(Icons.shopping_cart, color:Colors.white ,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        MenuModel.title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    Row(children: [
                      Icon(Icons.location_on,color: greencolor,),
                      SizedBox(width: 5.w,),
                      Text('19 Km', style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 20.w,),
                      Icon(Icons.star_half_outlined,color: greencolor,),
                      SizedBox(width: 5.w,),
                      Text('${MenuModel.rating?.rate}', style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 10.w,),
                      Text('\$${MenuModel.price}',style: TextStyle(color: greencolor, fontWeight: FontWeight.bold),)
                    ],),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: 300.w,
                        child: Text(
                          '${MenuModel.description}',
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                        child: Row(
                          children: [
                            Text('Popular Menu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                            SizedBox(width:60.w,),
                            MaterialButton(
                              onPressed:(){Get.to(Exploremenuwithfilter());},
                              child: Text('View All',
                                style: TextStyle(color:Colors.orange,
                                ),),),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
    FutureBuilder(  future: menucontroller.loadProductsFrommenu(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
        return Container(
      height: 200.h,
      width: 300.w,
      child: GridView.builder(
        physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      crossAxisCount: 1,
      ),
      itemCount: menucontroller.products.length,
      itemBuilder: (BuildContext context, int index) {
      return Container(
      height: 70.h,
      padding: EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Column(
      children: [
      Container(
      height: 80.h,
      width: 60.w,
      decoration: BoxDecoration(
      image: DecorationImage(
      image: NetworkImage(
      menucontroller.products[index].image.toString()),
      fit: BoxFit.fill,
      ),
      ),
      ),
      SizedBox(width: 8.w),
      Expanded(
      child: Padding(
      padding:  EdgeInsets.all(8.0),
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
      SizedBox(height: 5.h,),
      Text(
      "\$${menucontroller.products[index].price.toString()}",
      style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
      ),
      ],
      ),
      ),
      )
      ],
      ),
      );
      },
      ),

      );

    }
    else{return Center(child: CircularProgressIndicator(color: greencolor));}},),

                          ],
                        ),
                      Container(
    transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                          child: Text('Testimonials', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),)),
                      Expanded(
                        child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: 2,
    itemBuilder:(BuildContext context, index) {
                        return Container(
                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                          child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Image.asset('assets/images/Photo Profile.png',  width: 80.w,
                                                  height: 150.h,
                                                  fit:BoxFit.fill )),
                                          SizedBox(width: 10.w,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10.h,),
                                              Row(
                                                children: [
                                                  Text('Anamwp', style: TextStyle(
                                                    fontWeight: FontWeight.bold, color: blackcolor,
                                                  ),),
                                                  SizedBox(width: 10.w,),
                                                  Icon(Icons.star, color: greencolor,),
                                                  SizedBox(width: 2.w,),
                                                  Text('5'),
                                                  SizedBox(width: 10.w,),
                                                  Text('12 April 2021', style: TextStyle(color: Colors.grey),)
                                                ],
                                              ),
                                              SizedBox(height: 10.h,),
                                              Container(
                                                width:200,
                                                child: Text('This Is great, So delicious! You Must Here, With Your family . . ', style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.grey,
                                                ), maxLines: 2,),
                                              ),
                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ],

                            ),
                        );}
                        ),
                      ),

                    ],
                  ),
                )),

          ),

        ],
      ),
    );
  }
}
