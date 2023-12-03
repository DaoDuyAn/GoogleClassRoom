import 'package:di_dong/login.dart';
import 'package:di_dong/my_album2.dart';
import 'package:di_dong/my_class_room.dart';
import 'package:di_dong/my_counter.dart';
import 'package:di_dong/my_home_page.dart';
import 'package:di_dong/my_instagram.dart';
import 'package:di_dong/my_album.dart';
import 'package:di_dong/my_album2.dart';
import 'package:di_dong/product_listings.dart';
import 'package:flutter/material.dart';



void main() {
  // Cách 1:
  // var myApp = new MyApp();
  // runApp(myApp);

  // Cách 2:
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Hàm tạo

  @override
  Widget build(BuildContext context) { // Tạo ra giao diện cho Widget

    return MaterialApp(
      title: "App Nhóm 3", // MyGGClassRoom
      home: MyCounter(),
      //  home: MyInstagram(),
      // home: MyProductList(),
      // home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lobster',
        primarySwatch: MaterialColor(0xFFFF5252, <int, Color>{
          50: Color(0xFFFF5252),
          100: Color(0xFFFF5252),
          200: Color(0xFFFF5252),
          300: Color(0xFFFF5252),
          400: Color(0xFFFF5252),
          500: Color(0xFFFF5252),
          600: Color(0xFFFF5252),
          700: Color(0xFFFF5252),
          800: Color(0xFFFF5252),
          900: Color(0xFFFF5252),
        }),

      ),// tắt nhãn Debug
    );
  }
}
