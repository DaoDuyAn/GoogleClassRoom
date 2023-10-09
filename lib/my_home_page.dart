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

  String imageURL = 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2643&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "Top 52 Thane Quảng Bình", // Nội dung
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
                  fontSize: 24,
                  fontFamily: 'DancingScript'
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
              height: 100,
              child: ListView(
                //cuộn
                scrollDirection: Axis.horizontal,
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
            Image(
              image: NetworkImage(imageURL),
              height: 200,
            ),

            // 9/10/2023: BoxShadow, Stack, Positioned
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: AssetImage('assets/images/anh1.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height/3,
              child: Stack(
                children: [
                  Positioned(
                      child: Text(
                        "Hello",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 40,
                            shadows: [BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                offset: Offset(5,5)
                            )]
                        ),
                      ),
                    bottom: 20,
                    left: 50,
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.heart_broken,
                        color: Colors.redAccent,
                        size: 40,
                      ),
                    ),
                    top: 10,
                    right: 24,
                  )
                ],

              ),
            ),
            Image(
              image: AssetImage('assets/images/google_img.jpg'),
              height: 200,
            ),

          ],
        ),
      ), // Center: giống thẻ div
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
