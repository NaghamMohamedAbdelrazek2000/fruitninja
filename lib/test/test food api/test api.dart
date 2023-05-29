import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Food.dart';
import 'foodapi.dart';

class MyHomePage extends StatelessWidget {
  final FoodApi foodApi = FoodApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
      ),
      body: FutureBuilder(
        future: foodApi.loadProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                var item = snapshot.data![index];
                return ListTile(
                leading:  Container(
                  height: 100.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${item.pic}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                  title: Text(item.name.toString()),
                  subtitle: Text(item.description.toString()),
                  trailing: Text('\$${item.price}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load food from API: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


