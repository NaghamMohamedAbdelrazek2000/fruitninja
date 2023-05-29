import 'Food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Sharedpreference/Sharedpreference.dart';
class FoodApi {
    Future<List<Food>> loadProducts() async {
        try {
            var headers = {
                'Authorization': 'Bearer 266|75tyAmBmdGhiroyrKpxapytyWhfwNOpuP4il7Ar2',
            };
            var url = 'http://206.189.103.8/api/restaurent';
            var response = await http.get(Uri.parse(url), headers: headers);

            if (response.statusCode == 200) {
                print(response.body);
                var data = jsonDecode(response.body)['data'];
                var items = List<Food>.from(data.map((x) => Food.fromJson(x)));
                return items;
            } else {
                throw Exception('Failed to load food from API.');
            }
        } catch (e) {
            throw Exception('Failed to load food from API: $e');
        }
    }
}

// void loadProducts() async {
//     var headers = {
//         'Authorization': 'Bearer 258|reXnMzJd0Bdv82ybQew1rqR82vf2rSZbVH9K8cMP'
//     };
//     var request = http.MultipartRequest('GET', Uri.parse('http://206.189.103.8/api/food'));
//
//     request.headers.addAll(headers);
//
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//         print(await response.stream.bytesToString());
//     }
//     else {
//         print(response.reasonPhrase);
//     }
//
// }
