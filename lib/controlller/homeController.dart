// // ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names, unused_import

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:pts2024/model/model.dart'; // Pastikan import model

// Future<List<Products>?> getProducts10() async {
//   await Future.delayed(Duration(seconds: 3));
//   String url = "${dotenv.env['IP']}/products";
//   Uri urlData = Uri.parse(url);

//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String token = "Bearer ${prefs.getString('token')}";

//   final respon = await http.get(urlData, headers: {"Authorization": token});

//   if (respon.statusCode == 200) {
//     List<Products> data = productsFromJson(respon.body);
//     return data;
//   } else {
//     return null;
//   }
// }

// Future<List<Categories>?> getCategories() async {
//   await Future.delayed(Duration(seconds: 3));
//   String url = "${dotenv.env['IP']}/categories";
//   Uri urlData = Uri.parse(url);

//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String token = "Bearer ${prefs.getString('token')}";

//   final respon = await http.get(urlData, headers: {"Authorization": token});

//   if (respon.statusCode == 200) {
//     List<Categories> data = categoriesFromJson(respon.body);
//     return data;
//   } else {
//     return null;
//   }
// }