import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodninja/Constants/Constants.dart';
import 'package:get/get.dart';
import '../../../model/menu/menumodel.dart';
import '../../Home/Exploremenuwithfilter/ExploremenuwithfilterController.dart';
import '../VoucherPromo.dart';
class orderdetails extends StatelessWidget {
  orderdetails({Key? key,}) : super(key: key);
  Exploremenuwithfiltercontroller cartcontroller =Get.put(Exploremenuwithfiltercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){ Get.back();},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){cartcontroller.clearcart();},
            icon: Icon(
              Icons.backspace,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order details', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: blackcolor),),
              SizedBox(height: 20.h,),
              Obx(() => Container(
                height: 300.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cartcontroller.cartlist.length,
                    itemBuilder: (context, index) {
                      return  Slidable(
                        endActionPane:ActionPane(
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction( icon: Icons.delete,backgroundColor: Colors.orange, onPressed: (BuildContext context) { cartcontroller.removecart(cartcontroller.cartlist[index]); },)
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image.network(
                                            cartcontroller.cartlist[index].image.toString()),),
                                      SizedBox(width: 20.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:150.w,
                                            child: Text('${cartcontroller.cartlist[index].title.toString()}', style: TextStyle(
                                              fontWeight: FontWeight.bold, color: blackcolor,
                                            ), maxLines: 2,
                                              overflow: TextOverflow.ellipsis,),
                                          ),
                                          SizedBox(height: 5.h,),
                                          SizedBox(
                                            width:150.w,
                                            child: Text('${cartcontroller.cartlist[index].description.toString()}', style: TextStyle(
                                              fontWeight: FontWeight.bold, color: Colors.green,
                                            ), maxLines: 2,
                                              overflow: TextOverflow.ellipsis,),
                                          ),
                                          SizedBox(height: 5.h,),
                                          Text('\$ ${cartcontroller.cartlist[index].price.toString()}', style: TextStyle(
                                            fontWeight: FontWeight.bold, color: greencolor,fontSize: 15.sp
                                          ),),
                                        ],
                                      ),
                                     //  Stack(
                                     //   children: [
                                     //     Container(
                                     //       alignment: Alignment.center,
                                     //       height: 35.h,
                                     //       width: 50.w,
                                     //       decoration: BoxDecoration(
                                     //         shape: BoxShape.circle,
                                     //         color: Colors.grey,
                                     //       ),
                                     //       child: Container(
                                     //         transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                                     //         alignment: Alignment.center,
                                     //         child: IconButton(
                                     //           onPressed: (){cartcontroller.decrement();},
                                     //           icon: Icon(
                                     //             Icons.minimize_rounded,
                                     //             color: greencolor,
                                     //             size: 25.sp,
                                     //
                                     //           ),
                                     //         ),
                                     //       ),),
                                     //   ],
                                     // ),
                                     //  Obx(() => Text('${cartcontroller.count}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),),
                                     //  Stack(
                                     //    children: [
                                     //      Container(
                                     //        alignment: Alignment.center,
                                     //        height: 35.h,
                                     //        width: 50.w,
                                     //        decoration: BoxDecoration(
                                     //          shape: BoxShape.circle,
                                     //          color: greencolor,
                                     //        ),
                                     //        child: IconButton(
                                     //          onPressed: (){cartcontroller.increment();},
                                     //          icon: Icon(
                                     //            Icons.add,
                                     //            color: Colors.white,
                                     //            size: 22.sp,
                                     //
                                     //          ),
                                     //        ),),
                                     //    ],
                                     //  ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25.h),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),),
              SizedBox(height: 20,),
              Stack(
                children: [
                  Container(
                    height: 200.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: greencolor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 20.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Sub-Total', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 156.w,),
              Obx(() =>   Text('${cartcontroller.totalprice.toStringAsFixed(2)} \$', style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
              ),),),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text('Delivery Charge', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 115.w,),
                              Obx(() => Text('${cartcontroller.ShippingFee()}         \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text('Discount', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 162.w,),
                              Obx(() => Text('${cartcontroller.Discount().toStringAsFixed(2)}   \$', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              ),),)
                            ],
                          ),
                         Divider(color: Colors.white,),
                          Row(
                            children: [
                              Text('Total', style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                              )

                              ),
                              SizedBox(width: 184.w,),
                             Obx(() =>  Text('${cartcontroller.total().toStringAsFixed(2)} \$', style: TextStyle(
                               fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.sp,
                             ),),)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  child: MaterialButton(
                    onPressed:(){Get.to(VoucherPromo());},
                    child: Text('Place My Order',
                      style: TextStyle(color: greencolor,
                        fontSize: 15.sp,),),),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),

                        ],
                      ),
                    ),
                  ),],),
            ],
          ),
        ),
      ),
    );

  }
}
