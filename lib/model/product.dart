import 'dart:convert';

import 'package:http/http.dart' as http;
// https://pub.dev/packages/http

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'],
      price: json['price'] as double,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating(
        rate: json['rating']['rate'] as double,
        count: json['rating']['count'],
      ),
    );
  }

  static Future<List<Product>> fetchData() async {
    var url = 'https://fakestoreapi.com/products';
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);

    if (response.statusCode == 200){
      var body = response.body;
      var json = jsonDecode(body);

      List<Product> lstProduct = json.map<Product>((e) {
        return Product.fromJson(e);
      }).toList();
      return lstProduct;
    } else {
      throw new Exception("Lỗi lấy dữ liệu Product");
    }
  }

}
class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

}


// class Photo {
//   int albumId;
//   int id;
//   String title;
//   String url;
//   String thumbnailUrl;
//
//   Photo({
//     required this.albumId,
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.thumbnailUrl,
//   });
//   // dynamic là kiểu dl bất kì
//   factory Photo.fromJson(Map<String, dynamic>json) {
//     return Photo(
//         albumId: json['albumId'],
//         id: json['id'],
//         title: json['title'],
//         url: json['url'],
//         thumbnailUrl: json['thumbnailUrl']
//     );
//   }
//   static Future<List<Photo>> fetchData() async{
//     var apiUrl = 'https://jsonplaceholder.typicode.com/photos';
//     var response=  await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       var body = response.body;
//       var json = jsonDecode(body);
//
//       var ls = json.map<Photo>((e) {
//         return Photo.fromJson(e);
//       }).toList();
//       return ls;
//     } else {
//       throw new Exception("khong co du lieu tra ve");
//     }
//   }
// }
