import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyInstagram extends StatelessWidget {
  MyInstagram({super.key});

  List<InstaFollowers> lstInstaFollowers = [
    InstaFollowers(name: "daoduyan", avatar: "assets/images/an.jpg", isCeleb: false, post: "assets/images/an_post.jpg", postTitle: "Flex tí :))", likes: "100"),
    InstaFollowers(name: "rindonxoai", avatar: "assets/images/rindo.jpg", isCeleb: false, post: "assets/images/rindo_post.jpg", postTitle: "Surprise mt..", likes: "1"),
    InstaFollowers(name: "xunhiu", avatar: "assets/images/bxh.jpg", isCeleb: true, post: "assets/images/hieu_post.jpg", postTitle: "Chúc bé ngủ ngon <3", likes: "90.056"),
    InstaFollowers(name: "viet_backend", avatar: "assets/images/viet.jpg", isCeleb: true, post: "assets/images/viet_post.jpg", postTitle: "Anh đã ổn hơn", likes: "270.890"),
    InstaFollowers(name: "truonglee", avatar: "assets/images/school.jpg", isCeleb: false, post: "assets/images/school_post.jpg", postTitle: "Và anh vẫn okey", likes: "298"),
    InstaFollowers(name: "tuntran", avatar: "assets/images/petun.jpg", isCeleb: true, post: "assets/images/petun_post.jpg", postTitle: "No cap ...", likes: "680.312"),
    InstaFollowers(name: "hunglor", avatar: "assets/images/hung.jpg", isCeleb: false, post: "assets/images/hung_post.jpg", postTitle: "Hôm nay là ngày buồn nhất mà mình đã gặp", likes: "34"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow <3
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child:  PopupMenuButton(
            offset: Offset(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints.expand(width: 180, height: 96),
            tooltip: "",
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Đang theo dõi"),
                      Icon(
                        Icons.perm_identity_outlined,
                        color: Colors.black87,
                        size: 30,
                      ),
                    ],
                  ),
                  height: 40,
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Yêu thích"),
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child:  Icon(
                          FontAwesomeIcons.star,
                          color: Colors.black87,
                        ),
                     )
                    ],
                  ),
                  height: 40,
                ),
              ];
            },
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/logo_insta.png'),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size:30,
                color: Colors.black87,
              )
            ],
          )
          ),
        ),
        leadingWidth: 210,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: (){

              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
              ),
              color: Colors.black87,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: (){

              },
              icon: Icon(
                  FontAwesomeIcons.paperPlane
              ),
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // STORY <3
          Container(
            height: 112,
            padding: EdgeInsets.only(top: 9),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: lstInstaFollowers.map((e) {
                  return  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        Container(
                          width: 67,
                          height: 67,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF9B2282),
                                  Color(0xFFEEA836)
                                ]
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(e.avatar)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 1
                                        )
                                      ]
                                  )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: (lstInstaFollowers.indexOf(e) == 0)
                                  ? 74
                                  : 65
                            ),
                            child: Text(
                              (lstInstaFollowers.indexOf(e) == 0)
                                  ? 'Tin của bạn'
                                  : e.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-180, -54),
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_circle_rounded,
                color: Colors.blue,
                size: 20,
              ),
            ),
          ),
          // LINE <3
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Divider(
              color: Color(0xFFE8E8E8),
            ),
          ),

          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
               ...lstInstaFollowers.map((e) {
                 return Container(
                   margin: EdgeInsets.only(bottom: 30),
                   child: Column(
                     children: [
                       // POST HEADER
                       ListTile(
                         // Avatar
                         leading: Container(
                           width: 60,
                           height: 60,
                           padding: const EdgeInsets.all(2.0),
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                                 begin: Alignment.topCenter,
                                 end: Alignment.bottomCenter,
                                 colors: [
                                   Color(0xFF9B2282),
                                   Color(0xFFEEA836)
                                 ]
                             ),
                             shape: BoxShape.circle,
                           ),
                           child: Container(
                             width: 58,
                             height: 58,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               shape: BoxShape.circle,
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(4.0),
                               child: Container(
                                   width: 65,
                                   height: 65,
                                   decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       image: DecorationImage(
                                           image: AssetImage(e.avatar)
                                       ),
                                       boxShadow: [
                                         BoxShadow(
                                             color: Colors.grey,
                                             spreadRadius: 1
                                         )
                                       ]
                                   )
                               ),
                             ),
                           ),
                         ),
                         title: Container(
                           child: Row(
                             children: [
                               Text(
                                 e.name,
                                 style: TextStyle(
                                     fontSize: 18,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black87
                                 ),
                               ),
                               e.isCeleb
                               ? Container(
                                 margin: const EdgeInsets.only(left: 6),
                                 child: Icon(
                                   Icons.check_circle_rounded,
                                   color: Color(0xFF2BA0FF),
                                   size: 16,
                                 ),
                               )
                               : Container()
                             ],
                           ),
                         ),
                         trailing: IconButton(
                           icon: Icon(
                             Icons.more_horiz_rounded,
                             color: Colors.black87,
                           ),
                           onPressed: (){},
                         ),
                       ),
                       // POST IMAGE
                       Container(
                         margin: EdgeInsets.only(top: 10),
                         height: 451,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage(e.post),
                                 fit: BoxFit.cover
                             )
                         ),
                       ),
                       // ACTIONS <3
                       Container(
                         child: ListTile(
                           leading: Wrap(
                             spacing: 12,
                             children: [
                               Icon(
                                 Icons.favorite_border,
                                 size: 28,
                                 color: Colors.black87,
                               ),
                               Icon(
                                 FontAwesomeIcons.comment,
                                 size: 26,
                                 color: Colors.black87,
                               ),Icon(
                                 FontAwesomeIcons.paperPlane,
                                 size: 23,
                                 color: Colors.black87,
                               ),
                             ],
                           ),

                           trailing: Icon(
                             Icons.turned_in_not_rounded,
                             size: 28,
                             color: Colors.black87,
                           ),
                         ),
                       ),
                       // DETAILS
                       Container(
                         margin: EdgeInsets.only(left: 19),
                         alignment: Alignment.centerLeft,
                         child: Text(
                           e.likes + " lượt thích",
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 18
                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 19, top: 8),
                         alignment: Alignment.centerLeft,
                         child: Wrap(
                           spacing: 4,
                           children: [
                             Text(
                               e.name,
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18
                               ),
                             ),
                             Text(
                               e.postTitle,
                               style: TextStyle(
                                   fontSize: 18
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 19, top: 6),
                         alignment: Alignment.centerLeft,
                         child: Text(
                           "Xem tất cả 100 bình luận",
                           style: TextStyle(
                               fontSize: 18,
                               color: Colors.grey
                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 19, top: 6),
                         child: Row(
                           children: [
                             CircleAvatar(
                               backgroundImage: AssetImage(lstInstaFollowers[0].avatar),
                               radius: 14,
                             ),
                             SizedBox(width: 8),
                             Text(
                               "Thêm bình luận...",
                               style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.grey
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 19, top: 6),
                         child: Row(
                           children: [
                             Text(
                               "3 giờ trước",
                               style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.grey
                               ),
                             ),
                             SizedBox(width: 8),
                             Transform.translate(
                               offset: Offset(0, -4), // Dịch lên 4px
                               child: Text(
                                 ".",
                                 style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.grey,
                                 ),
                               ),
                             ),
                             SizedBox(width: 8),
                             Text(
                               "Xem bản dịch",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black87
                               ),
                             )
                           ],
                         ),
                       ),
                     ],
                   )
                 );
               }).toList(),
              ],
            ),
          )
        ],



      ),
      bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black87,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30,

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: '',

              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie_creation_outlined,
                  color: Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ),
                label: '',
              ),
            ],
        ),
    );
  }
}

class InstaFollowers {
  late String name;
  late String avatar;
  late bool isCeleb;
  late String post;
  late String postTitle;
  late String likes;

  InstaFollowers({
    required this.name,
    required this.avatar,
    required this.isCeleb,
    required this.post,
    required this.postTitle,
    required this.likes,
  });
}
