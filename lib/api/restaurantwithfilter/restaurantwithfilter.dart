import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/Restaurant.dart';
import '../../model/menu/menumodel.dart';
class Restaurantwithfilter {
  List< Restaurant> item = [] ;
  loadProductsFromApi2()async{
    try {
            var headers = {
                'Authorization': 'Bearer 266|75tyAmBmdGhiroyrKpxapytyWhfwNOpuP4il7Ar2',
            };
            var url = 'http://206.189.103.8/api/restaurent';
            var response = await http.get(Uri.parse(url), headers: headers);

            if (response.statusCode == 200) {
                print(response.body);
                var data = jsonDecode(response.body)['data'];
                var items = List<Restaurant>.from(data.map((x) => Restaurant.fromJson(x)));
                return items;
            } else {
                throw Exception('Failed to load food from API.');
            }
        } catch (e) {
            throw Exception('Failed to load food from API: $e');
        }
    }
  }
