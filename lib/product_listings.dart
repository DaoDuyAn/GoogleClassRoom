import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:di_dong/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'model/product.dart';

class MyProductList extends StatefulWidget {
  const MyProductList({super.key});

  @override
  State<MyProductList> createState() => _MyProductListState();
}

class _MyProductListState extends State<MyProductList> {
  final _baseUrl = 'https://fakestoreapi.com/products';

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;

  int _apiCallCount = 0;
  int currentIndex = 0;
  int _itemsPerPage = 8;

  List<Product> _posts = [];

  late ScrollController _controller;

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 200 &&
        _apiCallCount < 6) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });


      try {
        final res = await http
            .get(Uri.parse(_baseUrl));

        var json = jsonDecode(res.body);
        final List<Product> lstProduct = json.map<Product>((e) {
          return Product.fromJson(e);
        }).toList();

        if (_apiCallCount < 6) {

          for (int i = 0; i < _itemsPerPage; ++i) {
            int index = (currentIndex + i) % lstProduct.length;
            _posts.add(lstProduct[index]);
          }

          currentIndex = (currentIndex + _itemsPerPage) % lstProduct.length;
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }

        _apiCallCount++;

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
      final res = await http
          .get(Uri.parse(_baseUrl));

      var json = jsonDecode(res.body);
      final List<Product> lstProduct = json.map<Product>((e) {
        return Product.fromJson(e);
      }).toList();

      if (_apiCallCount < 6) {
        for (int i = 0; i < _itemsPerPage; ++i) {
          int index = (currentIndex + i) % lstProduct.length;
          _posts.add(lstProduct[index]);
        }

        currentIndex = (currentIndex + _itemsPerPage) % lstProduct.length;
      } else {
        setState(() {
          _hasNextPage = false;
        });
      }

      _apiCallCount++;

    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }



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
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: const Text(
            'Siuuu Shop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 68,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1,
                          )
                      )
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/siu_logo.jpg'),
                        height: 52,
                        width: 52,
                        fit: BoxFit.cover,
                        alignment: Alignment.centerLeft,
                      ),
                      Text(
                        "Siuuu Shop",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child:  ListTile(
                        leading: Icon(
                          Icons.home_outlined,
                          color: Colors.black54,
                          size: 24,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child:  ListTile(
                        leading: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black54,
                          size: 24,
                        ),
                        title: Text(
                          "Cart",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    // LINE <3
                    Container(
                      margin: EdgeInsets.only(left: 70),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1.2,
                      ),
                    ),

                    // OPTIONS <3
                    Container(
                      margin: EdgeInsets.only(left: 2),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/an.jpg'),
                          radius: 16,
                        ),
                        title: Text(
                          'Đào Duy An',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 4),
                        child:  ListTile(
                          leading: Icon(
                            Icons.settings_outlined,
                            color: Colors.black54,
                            size: 21,
                          ),
                          title: Text(
                            "Setting",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child:  ListTile(
                          leading: Icon(
                            Icons.announcement_outlined,
                            color: Colors.black54,
                            size: 21,
                          ),
                          title: Text(
                            "Send feedback to Siuuu Shop",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child:  ListTile(
                          leading: Icon(
                            Icons.help_outline_outlined,
                            color: Colors.black54,
                            size: 21,
                          ),
                          title: Text(
                            "Help",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child:  ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.black54,
                            size: 21,
                          ),
                          title: Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: _isFirstLoadRunning
            ? const Center(
          child: CircularProgressIndicator( color: Colors.redAccent,),
        )
            : Column(
          children: [
            // Search <3
            Container(
              height: 60,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 8.0),

              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => {},
                    padding: EdgeInsets.only(right: 4),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    padding: EdgeInsets.only(left: 4),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.black87),
                  ),

                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemCount: _posts.length,
                  controller: _controller,
                  padding: EdgeInsets.only(top: 20),
                  itemBuilder: (_, index) {
                    var product = _posts[index];
                    return CachedNetworkImage(
                      imageUrl: (product.image),
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                            color: Color(0xFFeaebed),
                          ),
                          margin: EdgeInsets.only(
                              bottom: 16, left: 10, right: 10),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white, // Set background-color
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Image(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                    width: 230,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8, left: 12, right: 12),
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  product.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8, left: 12),
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  '\$ ${product.price.toString()}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                width: 56,
                                height: 30,
                                margin: EdgeInsets.only(top: 2, right: 156),
                                padding: EdgeInsets.only(top: 2, bottom: 2, left: 3, right: 3),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                alignment: Alignment.centerLeft,
                                child:
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.rating.rate.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 19,
                                      ),
                                    )
                                  ],

                                ),
                              ),


                            ],
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator( color: Colors.redAccent),
                          ),
                        );
                      },
                    );
                  }),
            ),
            if (_isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                ),
              ),
          ],
        ));

  }
}


// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:di_dong/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
// //import 'model/product2.dart';
// import 'model/product.dart';
//
// class MyProductList extends StatefulWidget {
//   const MyProductList({super.key});
//
//   @override
//   State<MyProductList> createState() => _MyProductListState();
// }
//
// class _MyProductListState extends State<MyProductList> {
//   //final _baseUrl = 'https://api.escuelajs.co/api/v1/products';
//   final _baseUrl = 'https://fakestoreapi.com/products';
//   int _apiCallCount = 0;
//
//   // int _offset = 0;
//   // final int _limit = 8;
//
//   bool _isFirstLoadRunning = false;
//   bool _hasNextPage = true;
//   bool _isLoadMoreRunning = false;
//
//   List<Product> _posts = [];
//
//   void _loadMore() async {
//     if (_hasNextPage == true &&
//         _isFirstLoadRunning == false &&
//         _isLoadMoreRunning == false &&
//         _controller.position.extentAfter < 200 &&
//         _apiCallCount < 6) {
//       setState(() {
//         _isLoadMoreRunning = true; // Display a progress indicator at the bottom
//       });
//
//       //_offset += _limit; // Increase
//
//       try {
//         // final res = await http.get(Uri.parse("$_baseUrl?offset=$_offset&limit=$_limit"));
//         final res = await http
//             .get(Uri.parse(_baseUrl));
//
//         // final List fetchedPosts = json.decode(res.body);
//         var json = jsonDecode(res.body);
//         final List<Product> lstProduct = json.map<Product>((e) {
//           return Product.fromJson(e);
//         }).toList();
//
//         if (lstProduct.isNotEmpty) {
//           setState(() {
//             if (_apiCallCount.isEven) {
//               _posts.addAll(lstProduct.take(10));
//             } else {
//               _posts.addAll(lstProduct.skip(lstProduct.length - 10));
//             }
//           });
//           // setState(() {
//           //   _posts.addAll(lstProduct);
//           // });
//         } else {
//           setState(() {
//             _hasNextPage = false;
//           });
//         }
//
//         _apiCallCount++;
//       } catch (err) {
//         if (kDebugMode) {
//           print('Something went wrong!');
//         }
//       }
//
//       setState(() {
//         _isLoadMoreRunning = false;
//       });
//     }
//   }
//
//   void _firstLoad() async {
//     setState(() {
//       _isFirstLoadRunning = true;
//     });
//
//     try {
//       // final res = await http.get(Uri.parse("$_baseUrl?offset=$_offset&limit=$_limit"));
//       final res = await http
//           .get(Uri.parse(_baseUrl));
//
//       var json = jsonDecode(res.body);
//       final List<Product> lstProduct = json.map<Product>((e) {
//         return Product.fromJson(e);
//       }).toList();
//
//       setState(() {
//         if (_apiCallCount.isEven) {
//           _posts.addAll(lstProduct.take(10));
//         } else {
//           _posts.addAll(lstProduct.skip(lstProduct.length - 10));
//         }
//         //_posts = lstProduct;
//         // _posts = json.decode(res.body);
//       });
//     } catch (err) {
//       if (kDebugMode) {
//         print('Something went wrong');
//       }
//     }
//
//     setState(() {
//       _isFirstLoadRunning = false;
//     });
//   }
//
//   late ScrollController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _firstLoad();
//     _controller = ScrollController()..addListener(_loadMore);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.redAccent,
//           centerTitle: true,
//           title: const Text(
//             'Siuuu Shop',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//             ),
//           ),
//         ),
//         drawer: Drawer(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 68,
//                 child: DrawerHeader(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border(
//                           bottom: BorderSide(
//                             color: Colors.black12,
//                             width: 1,
//                           )
//                       )
//                   ),
//                   child: Row(
//                     children: [
//                       Image(
//                         image: AssetImage('assets/images/siu_logo.jpg'),
//                         height: 52,
//                         width: 52,
//                         fit: BoxFit.cover,
//                         alignment: Alignment.centerLeft,
//                       ),
//                       Text(
//                         "Siuuu Shop",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20,
//                           color: Colors.redAccent,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.only(left: 16),
//                   scrollDirection: Axis.vertical,
//                   children: [
//                     Container(
//                       child:  ListTile(
//                         leading: Icon(
//                           Icons.home_outlined,
//                           color: Colors.black54,
//                           size: 24,
//                         ),
//                         title: Text(
//                           "Home",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54
//                           ),
//                         ),
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                     Container(
//                       child:  ListTile(
//                         leading: Icon(
//                           Icons.shopping_cart_outlined,
//                           color: Colors.black54,
//                           size: 24,
//                         ),
//                         title: Text(
//                           "Cart",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54
//                           ),
//                         ),
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//
//                     // LINE <3
//                     Container(
//                       margin: EdgeInsets.only(left: 70),
//                       child: Divider(
//                         color: Colors.black12,
//                         thickness: 1.2,
//                       ),
//                     ),
//
//                     // OPTIONS <3
//                     Container(
//                       margin: EdgeInsets.only(left: 2),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: AssetImage('assets/images/an.jpg'),
//                           radius: 16,
//                         ),
//                         title: Text(
//                           'Đào Duy An',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 4),
//                         child:  ListTile(
//                           leading: Icon(
//                             Icons.settings_outlined,
//                             color: Colors.black54,
//                             size: 21,
//                           ),
//                           title: Text(
//                             "Setting",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54
//                             ),
//                           ),
//                           onTap: (){
//                             Navigator.pop(context);
//                           },
//                         )
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 5),
//                         child:  ListTile(
//                           leading: Icon(
//                             Icons.announcement_outlined,
//                             color: Colors.black54,
//                             size: 21,
//                           ),
//                           title: Text(
//                             "Send feedback to Siuuu Shop",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54
//                             ),
//                           ),
//                           onTap: (){
//                             Navigator.pop(context);
//                           },
//                         )
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 5),
//                         child:  ListTile(
//                           leading: Icon(
//                             Icons.help_outline_outlined,
//                             color: Colors.black54,
//                             size: 21,
//                           ),
//                           title: Text(
//                             "Help",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54
//                             ),
//                           ),
//                           onTap: (){
//                             Navigator.pop(context);
//                           },
//                         )
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 5),
//                         child:  ListTile(
//                           leading: Icon(
//                             Icons.logout,
//                             color: Colors.black54,
//                             size: 21,
//                           ),
//                           title: Text(
//                             "Logout",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54
//                             ),
//                           ),
//                           onTap: (){
//                             Navigator.of(context).pushReplacement(MaterialPageRoute(
//                               builder: (context) => LoginPage(),
//                             ));
//                           },
//                         )
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: _isFirstLoadRunning
//             ? const Center(
//                 child: CircularProgressIndicator( color: Colors.redAccent,),
//               )
//             : Column(
//                 children: [
//                   // Search <3
//                   Container(
//                     height: 60,
//                     margin: EdgeInsets.only(top: 10),
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search...',
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.clear),
//                           onPressed: () => {},
//                           padding: EdgeInsets.only(right: 4),
//                         ),
//                         prefixIcon: IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {},
//                           padding: EdgeInsets.only(left: 4),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                           borderSide: BorderSide(color: Colors.black87),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2 // 2 cột mỗi dòng
//                             ),
//                         itemCount: _posts.length,
//                         controller: _controller,
//                         padding: EdgeInsets.only(top: 20),
//                         itemBuilder: (_, index) {
//                           var product = _posts[index];
//                           return CachedNetworkImage(
//                             imageUrl: (product.image),
//                             imageBuilder: (context, imageProvider) {
//                               return Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       offset: Offset(0, 2),
//                                       blurRadius: 6.0,
//                                     ),
//                                   ],
//                                   color: Color(0xFFeaebed),
//                                 ),
//                                 margin: EdgeInsets.only(
//                                     bottom: 16, left: 10, right: 10),
//                                 padding: EdgeInsets.only(bottom: 10),
//                                 child: Column(
//                                   children: [
//                                     Expanded(
//
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(10.0),
//                                           topRight: Radius.circular(10.0),
//                                         ),
//                                         child: Image(
//                                           image: imageProvider,
//                                           fit: BoxFit.cover,
//                                           height: 200,
//                                           width: 230,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(top: 8, left: 12, right: 12),
//                                       padding: EdgeInsets.only(top: 8),
//                                       child: Text(
//                                         product.title,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       alignment: Alignment.centerLeft,
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(top: 8, left: 12),
//                                       padding: EdgeInsets.only(bottom: 4),
//                                       child: Text(
//                                         '\$ ${product.price.toString()}',
//                                         style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       alignment: Alignment.centerLeft,
//                                     ),
//
//
//                                     Container(
//                                       width: 56,
//                                       height: 30,
//                                       margin: EdgeInsets.only(top: 2, right: 156),
//                                       padding: EdgeInsets.only(top: 2, bottom: 2, left: 3, right: 3),
//                                       decoration: BoxDecoration(
//                                         color: Colors.redAccent,
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                       alignment: Alignment.centerLeft,
//                                       child:
//                                         Row(
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                                product.rating.rate.toString(),
//                                                style: TextStyle(
//                                                  fontSize: 14,
//                                                  fontWeight: FontWeight.bold,
//                                                  color: Colors.white
//                                                ),
//                                              ),
//                                             Container(
//                                               margin: EdgeInsets.only(left: 4),
//                                               child: Icon(
//                                                 Icons.star,
//                                                 color: Colors.white,
//                                                 size: 19,
//                                               ),
//                                             )
//                                           ],
//
//                                         ),
//                                       ),
//
//
//                                   ],
//                                 ),
//                               );
//                             },
//                             placeholder: (context, url) {
//                               return Container(
//                                 child: Center(
//                                   child: CircularProgressIndicator( color: Colors.redAccent),
//                                 ),
//                               );
//                             },
//                           );
//                         }),
//                   ),
//                   if (_isLoadMoreRunning == true)
//                     const Padding(
//                       padding: EdgeInsets.only(top: 10, bottom: 10),
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.redAccent,
//                         ),
//
//                       ),
//                     ),
//                 ],
//               ));
//
//   }
// }
