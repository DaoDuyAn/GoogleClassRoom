import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MyClassRoom extends StatelessWidget {
  MyClassRoom({super.key});

  List<ClassItem> lstClassItem = [
    ClassItem(subject: "Lập trình di động", semester: "2023.2024.1.TIN3001.001", lecturer: "Nguyễn Dũng", image: "assets/anh1.jpg", letter: "L", bgc: Colors.green),
    ClassItem(subject: "Java Nâng cao", semester: "2023.2024.1.TIN3002.002", lecturer: "Nguyễn Hoàng Hà", image: "assets/anh2.jpg", letter: "J", bgc: Colors.grey),
    ClassItem(subject: "Xây dựng ứng dụng với .NET Framework", semester: "2023.2024.1.TIN3003.003", lecturer: "Nguyễn Dũng", image: "assets/anh3.jpg", letter: "X", bgc: Colors.blueAccent),
    ClassItem(subject: "Trí tuệ nhân tạo", semester: "2023.2024.1.TIN3004.004", lecturer: "Nguyễn Ngọc Thủy", image: "assets/anh4.jpg", letter: "T", bgc: Colors.black45),
    ClassItem(subject: "CTDL & GT", semester: "2023.2024.1.TIN3005.005", lecturer: "Nguyễn Đức Nhuận", image: "assets/anh5.jpg", letter: "C", bgc: Colors.blue),
    ClassItem(subject: "Xác suất thống kê", semester: "2023.2024.1.TIN3006.006", lecturer: "Trần Thiện Thành", image: "assets/anh6.jpg", letter: "X", bgc: Colors.deepOrangeAccent),
    ClassItem(subject: "Cơ sở toán", semester: "2023.2024.1.TIN3007.007", lecturer: "Bùi Văn Chiến", image: "assets/anh3.jpg", letter: "C", bgc: Colors.blueAccent),
    ClassItem(subject: "Anh văn chuyên ngành", semester: "2023.2024.1.TIN3008.008", lecturer: "Lê Thị Ngọc Lan", image: "assets/anh4.jpg", letter: "A", bgc: Colors.grey),
  ];

  List<String> lstTopic = ["KH", "DS", "AM", "HH", "LQuan", "HUHUHAHA", "dfgh", "dfg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black45,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        title: Align(
          child: Text(
            "Google Lớp học",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              padding: EdgeInsets.all(2),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        height: 560,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                              child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child:  IconButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.close,
                                          )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 104, top: 4),
                                      alignment: Alignment.center,
                                      child: Image(
                                        height: 120,
                                        width: 130,
                                        image: AssetImage('assets/google_img.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              child:
                                  ListView(
                                    children: [
                                      Container(

                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.blueAccent,
                                            radius: 18,
                                            child: Text(
                                              "An",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            "An Đào Duy",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          subtitle: Text(
                                              '20t1020293@husc.edu.vn',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black38,
                                              ),
                                          ),
                                          onTap: (){
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                            ),
                            Container(
                              height: 40,
                              width: 210,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1, color: Colors.black12)
                              ),
                              child:
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Quản lý Tài khoản Google",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                            ),
                            // LINE <3
                            Container(
                              margin: EdgeInsets.only(top: 14),
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1.2,
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.deepOrangeAccent,
                                        radius: 18,
                                        child: Text(
                                          "An",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "An Đào",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'daoduyan8801@gmail.com',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black38,
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.pinkAccent,
                                        radius: 18,
                                        child: Text(
                                          "B",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "Bellingham",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'belinhham@gmail.com',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black38,
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: ListTile(
                                      leading: Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Icon(
                                          Icons.person_add_alt_outlined,
                                        ),
                                      ),
                                      title: Text(
                                        "Thêm tài khoản khác",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    ),

                                  ),
                                  Container(
                                    child: ListTile(
                                      leading: Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Icon(
                                          Icons.manage_accounts_outlined,
                                        ),
                                      ),
                                      title: Text(
                                        "Quản lý các tài khoản trên thiết bị này",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            // LINE <3
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1.2,
                              ),
                            ),
                            Container(
                              height: 104,
                              child: Column(
                                children: [
                                  Container(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                          'Chính sách quyền riêng tư',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      child: Text(
                                          '.',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                      ),
                                  ),
                                  Container(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Điều khoản dịch vụ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 20,
                child: Text(
                  "An",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                //cuộn
                scrollDirection: Axis.vertical,
                children: lstClassItem.map((item) {
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      )
                    ),
                    padding: EdgeInsets.only(left: 14, top: 14),
                    margin: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.subject,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                PopupMenuButton(
                                  icon: Icon(
                                    Icons.more_horiz_rounded,
                                    color: Colors.white,
                                  ),
                                  itemBuilder: (context) {
                                    List<String> lstMenuItem = ["Hủy đăng ký"];

                                    var lstItem =  lstMenuItem.map((e) {
                                      return PopupMenuItem(child: Text(e));
                                    }).toList();
                                    return lstItem;
                                  },
                                )
                              ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                  item.semester,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 44),
                          child: Row(
                            children: [
                              Text(
                                  item.lecturer,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 120,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Tham gia lớp học",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Tạo lớp học",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                      image: AssetImage('assets/google_img.jpg'),
                      height: 120,
                      width: 121,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    ),
                    Text(
                      "Lớp học",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black54,
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
                        "Lớp học",
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
                    margin: EdgeInsets.only(left: 2),
                    child:  ListTile(
                      leading: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.black54,
                        size: 21,
                      ),
                      title: Text(
                        "Lịch",
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

                  // LINE <3
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1.2,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      child:  ListTile(
                        leading: Icon(
                          Icons.fact_check_outlined,
                          color: Colors.black54,
                          size: 21,
                        ),
                        title: Text(
                          "Việc cần làm",
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

                  // DÁNH SÁCH LỚP HỌC <3
                  ...lstClassItem.map((item) {
                    return Container(
                      margin: EdgeInsets.only(left: 2),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: item.bgc,
                          radius: 12,
                          child: Text(
                            item.letter,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          item.subject,
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
                    );
                  }).toList(),

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
                      margin: EdgeInsets.only(left: 4),
                      child:  ListTile(
                        leading: Icon(
                          Icons.archive_outlined,
                          color: Colors.black54,
                          size: 21,
                        ),
                        title: Text(
                          "Lớp học đã lưu trữ",
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
                      margin: EdgeInsets.only(left: 4),
                      child:  ListTile(
                        leading: Icon(
                          Icons.folder_open_outlined,
                          color: Colors.black54,
                          size: 21,
                        ),
                        title: Text(
                          "Thư mục Lớp học",
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
                      margin: EdgeInsets.only(left: 4),
                      child:  ListTile(
                        leading: Icon(
                          Icons.settings_outlined,
                          color: Colors.black54,
                          size: 21,
                        ),
                        title: Text(
                          "Cài đặt",
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
                          "Gửi phản hồi cho Google",
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
                          "Trợ giúp",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassItem {
  late String subject;
  late String semester;
  late String lecturer;
  late String image;
  late String letter;
  late Color bgc;

  ClassItem({
    required this.subject,
    required this.semester,
    required this.lecturer,
    required this.image,
    required this.letter,
    required this.bgc,
  });
}

