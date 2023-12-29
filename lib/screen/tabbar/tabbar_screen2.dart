// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ice_durable_articles/TestSearchPage/search_page_test.dart';
// import 'package:ice_durable_articles/profileScreen/profiletest.dart';
// import 'package:ice_durable_articles/profileScreen/screens/profile_screen.dart';
// import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Admin.dart';
// import 'package:flutter/rendering.dart';
// import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Student.dart';
// import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Teacher.dart';
// import 'package:ice_durable_articles/screen/borrwing/borrwing_history_screen.dart';
// import 'package:ice_durable_articles/screen/home/home_page.dart';
// import 'package:ice_durable_articles/screen/qr_scanner/after_scanqr/qr_details.dart';
// import 'package:ice_durable_articles/screen/qr_scanner/qr_scanner2.dart';
// import 'package:ice_durable_articles/test_brs_button/post_brs.dart';
// import 'package:ice_durable_articles/test_brs_button/test_perf.dart';
// // import 'package:ice_durable_articles/test_brs_button/test_status%20copy.dart';
// import 'package:ice_durable_articles/test_brs_button/test_brs.dart';
// import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';

// class TabBarScreen extends StatefulWidget {
//   // final String uid;
//   // const TabBarScreen({required this.uid, Key? key}) : super(key: key);
//   const TabBarScreen({Key? key}) : super(key: key);

//   @override
//   State<TabBarScreen> createState() => _TabBarScreen2State();
// }

// class _TabBarScreen2State extends State<TabBarScreen> {
//   late int userRole;
//   @override
//   void initState() {
//     checkUser();
//     // _getuser = checkUser();
//     super.initState();
//   }

//   checkUser() async {
//     var user = await SharedPerfs().getUser();
//     final parsedJson = json.decode(user
//         .toString()); // ต้องประกาศตัวแปร เพื่อ setstate ให้ userRole รับค่าได้
//     print("CheckUser");
//     print(user);

//     setState(() {
//       userRole = int.parse(parsedJson[
//           'role']); //เรียกใช้ตัวแปร userRole ที่ประกาศไว้ แล้วให้ userRole รับค่าจาก parsedJson['role']
//     });
//     // print(user["name"]);

//     // final parsedJson = json.decode(user);
//     // print("TABBAR");
//     // print(parsedJson['user_id']);
//     // print(parsedJson['name']);
//     // print("บทบาทเพื่อแยกหน้า Profile");
//     // print(parsedJson['role']);
//     // if (parsedJson['role'] == "55") {
//     //   print("Role Success");
//     // } else {
//     //   print("Role Error");
//     // }

//     // setState(() {
//     //   // checkUser() async {
//     //   //   var user = await SharedPerfs().getUser();
//     //   //   final parsedJson = json.decode(user);
//     //   //   role = int.parse(parsedJson['role']);
//     //   // }
//     //   // var role = await SharedPerfs().getUser();
//     //   // role = int.parse(parsedJson['role']);
//     //   // user = parsedJson['user_id'];

//     //   // Update the state with the parsedJson value
//     // });
//   }

//   Widget build(BuildContext context) => CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(
//           backgroundColor: Color.fromARGB(255, 199, 31, 23),
//           activeColor: Color.fromARGB(255, 255, 255, 255),
//           inactiveColor: CupertinoColors.white.withOpacity(0.7),
//           onTap: (index) {
//             print("Tab $index");
//           },
//           items: [
//             BottomNavigationBarItem(
//                 label: "Home",
//                 icon: Icon(CupertinoIcons.home),
//                 activeIcon: Icon(CupertinoIcons.house_fill)),
//             BottomNavigationBarItem(
//                 label: "QR Scanner",
//                 icon: Icon(CupertinoIcons.qrcode),
//                 activeIcon: Icon(CupertinoIcons.qrcode_viewfinder)),
//             // if (userRole == 3)
//             //   BottomNavigationBarItem(
//             //     label: "ประวัติการยืม",
//             //     icon: Icon(CupertinoIcons.square_list),
//             //     activeIcon: Icon(CupertinoIcons.square_list_fill),
//             //   ),
//             BottomNavigationBarItem(
//                 label: "Profile",
//                 icon: Icon(CupertinoIcons.person),
//                 activeIcon: Icon(CupertinoIcons.person_fill)),
//           ],
//         ),
//         tabBuilder: (context, index) {
//           switch (index) {
//             case 0:
//               return CupertinoTabView(
//                 builder: (context) => TestPerf(),
//               );
//             case 1:
//               return CupertinoTabView(
//                 builder: (context) => QRdetails(
//                   uid: "30",
//                   code: "01.06.00685",
//                 ),
//               );
//             case 2:
//               return CupertinoTabView(
//                 builder: (context) => POST_BRS(),
//               );
//             case 3:
//             default:
//               return FutureBuilder(
//                 future: SharedPerfs().getUser(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text("Error: ${snapshot.error}");
//                   } else {
//                     var _user = snapshot.data;
//                     print("CheckUser");
//                     print(_user);

//                     final parsedJson = json.decode(_user.toString());
//                     print("State Role");

//                     if (parsedJson['role'] == "1") {
//                       print("welcome Student Profile Page");
//                       return CupertinoTabView(
//                         builder: (context) => ProfileScreenST(),
//                       );
//                     } else if (parsedJson['role'] == "2") {
//                       print("welcome Teacher Profile Page");
//                       return CupertinoTabView(
//                         builder: (context) => ProfileScreenTC(),
//                       );
//                     } else if (parsedJson['role'] == "3") {
//                       print("welcome Admin Profile Page");
//                       return CupertinoTabView(
//                         builder: (context) => ProfileScreenAD(),
//                       );
//                     } else {
//                       return CupertinoTabView(
//                         builder: (context) => ProfileScreen(),
//                       );
//                     }
//                   }
//                 },
//               );
//             // Add a closing brace for the "default" case
//           }
//         },
//       );
// }
// //ถ้า role users เป็น 1 จะให้ไปที่หน้า ProfileScreenST
// //ถ้า role users เป็น 2 จะให้ไปที่หน้า ProfileScreenTC
// //ถ้า role users เป็น 3 จะให้ไปที่หน้า ProfileScreenAD
