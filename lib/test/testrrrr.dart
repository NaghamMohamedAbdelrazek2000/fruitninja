// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/menu/menumodel.dart';
//
//
// class MenuList extends StatefulWidget {
//   @override
//   _MenuListState createState() => _MenuListState();
// }
//
// class _MenuListState extends State<MenuList> {
//   List<menumodel> _menuItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMenuItems();
//   }
//
//   Future<void> fetchMenuItems() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       setState(() {
//         _menuItems = data.map((json) => menumodel.fromJson(json)).toList();
//       });
//     } else {
//       throw Exception('Failed to fetch menu items');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu List'),
//       ),
//       body: ListView.builder(
//         itemCount: _menuItems.length,
//         itemBuilder: (BuildContextcontext, int index) {
//           final menuItem = _menuItems[index];
//           return ListTile(
//             leading: Image.network(menuItem.image ?? ''),
//             title: Text(menuItem.title ?? ''),
//             subtitle: Text(menuItem.description ?? ''),
//             trailing: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('\$${menuItem.price?.toStringAsFixed(2) ?? ''}'),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.star, color: Colors.yellow),
//                     SizedBox(width: 5),
//                     Text('${menuItem.rating?.rate?.toStringAsFixed(1) ?? ''} (${menuItem.rating?.count ?? 0})'),
//                   ],
//                 ),
//               ],
//             ),
//             onTap: () {
//               // TODO: Navigate to menu item details screen
//             },
//           );
//         },
//       ),
//     );
//   }
// }
////////////////////////////////////////////////counter
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
//  ),orderdetails