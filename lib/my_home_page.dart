import 'package:flutter/material.dart';

// Gõ "stless" -> tab
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key); // Hàm tạo
  List<MenuItemBottom> lstMenuItemBottom = [
    MenuItemBottom(label: "Home", iconData: Icons.home),
    MenuItemBottom(label: "Profile", iconData: Icons.supervised_user_circle_sharp, color: Colors.red),
    MenuItemBottom(label: "Logout", iconData: Icons.logout, color: Colors.blue)
  ];
  List<String> lstTopic = ["KH", "DS", "AM", "HH", "LQuan", "HUHUHAHA"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello world", // Nội dung
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Xin chào mọi người",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.yellow,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orange,
                    Colors.yellow,
                  ]
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Canh hướng chính
                children: [
                  IconButton(
                     onPressed: (){
                       showToast(context, "Bạn đã nhấn nút Home", Colors.red);

                       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                       // Text("Haha", style: TextStyle(color: Colors.red),)));
                     },
                     icon: Icon(
                        Icons.home,
                        color: Colors.red,
                        size: 50,
                      ),
                   ),
                  IconButton(
                    onPressed: (){
                      showToast(context, "Bạn đã nhấn nút User", Colors.green);
                    },
                    icon: Icon(
                      Icons.account_box,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      showToast(context, "Bạn đã nhấn nút Share", Colors.deepPurple);
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.deepPurple,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container( // dùng  Expand sẽ chiếm hết khoảng trống còn lại
              height: 400,
              child: ListView(
                //cuộn
                scrollDirection: Axis.vertical,
                children: lstTopic.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ), // Center: giống thẻ div
      appBar: AppBar(
        title: Text(
          "Trang chủ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        leading: Icon(
          Icons.home,
          color: Colors.white,
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.add,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              List<String> lstMenuItem = ["Thông tin cá nhân", "Đổi mật khẩu", "Đăng xuất"];

              var lstItem =  lstMenuItem.map((e) {
                return PopupMenuItem(child: Text(e));
              }).toList();
              return lstItem;
            },
          )
        ],

        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: lstMenuItemBottom.map((e) {
              return BottomNavigationBarItem(
                icon: Icon(
                  e.iconData,
                  color: e.color,
                 ),
                label: e.label,
              );
            }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //draw
    );
  }

  void showToast(BuildContext context, String data, Color color){
    var snackBar = new SnackBar(
      content: Text(
        data,
        style: TextStyle(
          color: color,
          fontSize: 25,
        ),
      ),
      duration: Duration(milliseconds: 600),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class MenuItemBottom {
  late String label;
  late IconData iconData;
  late Color color;
  MenuItemBottom({
    required this.label,
    required this.iconData,
    this.color = Colors.black});
}
