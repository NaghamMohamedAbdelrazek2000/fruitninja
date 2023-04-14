import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Constants.dart';
import 'Exploremenuwithfilter/ExploremenuwithfilterController.dart';

class nearestrestaurant extends StatelessWidget {
  const nearestrestaurant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Exploremenuwithfiltercontroller menucontroller =Get.put(Exploremenuwithfiltercontroller());
    return  Row(
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

               );}

            else{return Center(child: CircularProgressIndicator(color: greencolor));}},)]

    );
  }
}
