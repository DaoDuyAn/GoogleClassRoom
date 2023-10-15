import 'package:di_dong/my_class_room.dart';
import 'package:di_dong/my_home_page.dart';
import 'package:di_dong/my_instagram.dart';

import 'package:flutter/material.dart';



void main() {
  // Cach 1:
  // var myApp = new MyApp();
  // runApp(myApp);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Hàm tạo

  @override
  Widget build(BuildContext context) { // Tạo ra giao diện cho Widget
    return MaterialApp(
      title: "App Nhóm 3", // MyGGClassRoom
      // home: MyClassRoom(),
      home: MyInstagram(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lobster'
      ),// tắt nhãn Debug
    );
  }
}
