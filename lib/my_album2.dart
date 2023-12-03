import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'model/product2.dart';

class MyAlbum2 extends StatefulWidget {
  const MyAlbum2({super.key});

  @override
  State<MyAlbum2> createState() => _MyAlbum2State();
}

class _MyAlbum2State extends State<MyAlbum2> {
  final _baseUrl = 'https://api.escuelajs.co/api/v1/products';

  int _offset = 0;
  final int _limit = 8;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  List<Product> _posts = [];

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 200) {

      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });

      _offset += _limit; // Increase

      try {
        final res = await http
            .get(Uri.parse("$_baseUrl?offset=$_offset&limit=$_limit"));

        // final List fetchedPosts = json.decode(res.body);
        var json = jsonDecode(res.body);
        final List<Product> lstProduct = json.map<Product>((e) {
          return Product.fromJson(e);
        }).toList();

        if (lstProduct.isNotEmpty) {
          setState(() {
            _posts.addAll(lstProduct);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      final res =
          await http.get(Uri.parse("$_baseUrl?offset=$_offset&limit=$_limit"));

      var json = jsonDecode(res.body);
      final List<Product> lstProduct = json.map<Product>((e) {
        return Product.fromJson(e);
      }).toList();

      setState(() {
        _posts = lstProduct;
        // _posts = json.decode(res.body);
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            'Danh sách sản phẩm',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2 // 2 cột mỗi dòng
                      ),
                      itemCount: _posts.length,
                      controller: _controller,

                      itemBuilder: (_, index) {
                        var product = _posts[index];
                        return CachedNetworkImage(
                            imageUrl: (product.category.image),
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        height: 70,
                                        width: 230,
                                      )),
                                    Container(
                                      margin: EdgeInsets.only(top: 8) ,
                                      child: Text(
                                        product.id.toString() + ". " + product.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              );
                            },
                            placeholder: (context, url) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            });
                      }
                    ),
                  ),
                  if (_isLoadMoreRunning == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ));
  }
}

// class MyProduct2 extends StatelessWidget {
//   MyProduct2({super.key, required this.lstProduct});
//
//   List<Product> lstProduct;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2
//       ),
//       //itemCount: lstProduct?.length,
//       itemCount: 20,
//       itemBuilder: (context, index) {
//         var product = lstProduct[index];
//
//         return CachedNetworkImage(
//             imageUrl: product?.category.image??"",
//             imageBuilder: (context, imageProvider) {
//               return Column(
//                 children: [
//                   Expanded(child: Image(
//                     image: imageProvider,
//                     fit: BoxFit.cover,
//                     height: 60,
//                   )),
//                   Text(
//                     product.title,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                 ],
//               );
//             },
//             placeholder: (context, url) {
//               return Container(
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             }
//         );
//       },
//     );
//   }
// }
