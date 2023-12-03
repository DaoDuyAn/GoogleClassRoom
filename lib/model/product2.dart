import 'dart:convert';

import 'package:http/http.dart' as http;
// https://pub.dev/packages/http

class Product {
  int id;
  String title;
  int price;
  String description;
  Category category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: Category(
        id: json['category']['id'] as int,
        name: json['category']['name'],
        image: json['category']['image'],
      ),
    );
  }

  // static Future<List<Product>> fetchData() async {
  //   var url = 'https://api.escuelajs.co/api/v1/products';
  //   var response = await http.get(Uri.parse(url));
  //   print(response.statusCode);
  //
  //   if (response.statusCode == 200){
  //     var body = response.body;
  //     var json = jsonDecode(body);
  //
  //     List<Product> lstProduct = json.map<Product>((e) {
  //       return Product.fromJson(e);
  //     }).toList();
  //     return lstProduct;
  //   } else {
  //     throw new Exception("Lỗi lấy dữ liệu Product");
  //   }
  // }

}

class Category {
  int id;
  String name;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

}