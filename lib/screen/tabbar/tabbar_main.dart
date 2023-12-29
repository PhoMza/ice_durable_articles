import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/TestSearchPage/search_page_test.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_veriflyDetails.dart';
import 'package:ice_durable_articles/profileScreen/profiletest.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Admin.dart';
import 'package:flutter/rendering.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Student.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Teacher.dart';
import 'package:ice_durable_articles/screen/borrwing/borrwing_history_screen.dart';
import 'package:ice_durable_articles/screen/home/home_page.dart';
import 'package:ice_durable_articles/screen/qr_scanner/after_scanqr/qr_details.dart';
import 'package:ice_durable_articles/screen/qr_scanner/qr_scanner2.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/homeAdmin.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/qr_scannerAdmin.dart';
import 'package:ice_durable_articles/test_brs_button/post_brs.dart';
import 'package:ice_durable_articles/test_brs_button/test_perf.dart';
import 'package:ice_durable_articles/test_brs_button/test_brs.dart';
import 'package:ice_durable_articles/test%20Home%20page%20student%20Admin/home_historyBorrow.dart';
import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';

class TabBarScreen2 extends StatefulWidget {
  // final String uid;
  // const TabBarScreen({required this.uid, Key? key}) : super(key: key);
  const TabBarScreen2({Key? key}) : super(key: key);

  @override
  State<TabBarScreen2> createState() => _TabBarScreen2State();
}

class _TabBarScreen2State extends State<TabBarScreen2> {
  //ประกาศตัวแปลไว้เพื่อรับค่าจาก SharedPerfs().getUser();
  late int userID;
  late int userRole;

  @override
  void initState() {
    checkUser();
    // _getuser = checkUser();
    super.initState();
  }

  checkUser() async {
    var user = await SharedPerfs().getUser();
    final parsedJson = json.decode(user
        .toString()); // ต้องประกาศตัวแปร เพื่อ setstate ให้ userRole รับค่าได้
    // print("CheckUser");
    // print(user);
    // print("TABBAR");
    // print(parsedJson['user_id']);
    // print(parsedJson['name']);
    // print("บทบาทเพื่อแยกหน้า Profile");
    // print(parsedJson['role']);
    // if (parsedJson['role'] == "1") {
    //   print("Role Success");
    // } else {
    //   print("Role Error");
    // }

    setState(() {
      userRole = int.parse(parsedJson[
          'role']); //เรียกใช้ตัวแปร userRole ที่ประกาศไว้ แล้วให้ userRole รับค่าจาก parsedJson['role']
      userID = int.parse(parsedJson['user_id']);
      print("user_id จากหน้า Tabbar = " + userID.toString());
      // print();
    });
    // print(user["name"]);
  }

  
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: tRedColor,
          activeColor: Color.fromARGB(255, 255, 255, 255),
          inactiveColor: CupertinoColors.white.withOpacity(0.7),
          onTap: (index) {
            print("Tab $index");
          },
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(CupertinoIcons.home),
                activeIcon: Icon(CupertinoIcons.house_fill)),
            BottomNavigationBarItem(
                label: "QR Scanner",
                icon: Icon(CupertinoIcons.qrcode),
                activeIcon: Icon(CupertinoIcons.qrcode_viewfinder)),
            // if (userRole == 3)
            //   BottomNavigationBarItem(
            //     label: "ประวัติการยืม",
            //     icon: Icon(CupertinoIcons.square_list),
            //     activeIcon: Icon(CupertinoIcons.square_list_fill),
            //   ),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(CupertinoIcons.person),
                activeIcon: Icon(CupertinoIcons.person_fill)),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FutureBuilder(
                future: SharedPerfs().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    var _user = snapshot.data;
                    print("CheckUser");
                    print(_user);
                    final parsedJson = json.decode(_user.toString());
                    print("State Role");
                    print("user_id = " + parsedJson['user_id']);
                    print("role = " + parsedJson['role']);

                    if (parsedJson['role'] == "1") {
                      print("welcome Student Profile Page");
                      return CupertinoTabView(
                        builder: (context) => HistoryUI(),
                      );
                    } else if (parsedJson['role'] == "2") {
                      print("welcome Teacher Profile Page");
                      return CupertinoTabView(
                        builder: (context) => HistoryUI(),
                      );
                    } else if (parsedJson['role'] == "3") {
                      print("welcome Admin Profile Page");
                      return CupertinoTabView(
                        builder: (context) => HomeAdminUI(),
                      );
                    } else {
                      return CupertinoTabView(
                        builder: (context) => HistoryUI(),
                      );
                    }
                  }
                },
              );

            case 1:
              return FutureBuilder(
                future: SharedPerfs().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    var _user = snapshot.data;
                    print("CheckUser");
                    print(_user);
                    final parsedJson = json.decode(_user.toString());
                    print("State Role");
                    print("user_id = " + parsedJson['user_id']);
                    print("role = " + parsedJson['role']);

                    if (parsedJson['role'] == "1") {
                      print("welcome Student QRScanner");
                      return CupertinoTabView(
                        builder: (context) => QRScanner2(
                          uid: userID.toString(),
                        ),
                      );
                    } else if (parsedJson['role'] == "2") {
                      print("welcome Teacher QRScanner");
                      return CupertinoTabView(
                        builder: (context) => QRScanner2(
                          uid: userID.toString(),
                        ),
                      );
                    } else if (parsedJson['role'] == "3") {
                      print("welcome Admin QRScanner ");
                      return CupertinoTabView(
                        builder: (context) => QRScannerAdmin(
                          uid: userID.toString(),
                        ),
                      );
                    } else {
                      return CupertinoTabView(
                        builder: (context) => QRScanner2(
                          uid: userID.toString(),
                        ),
                      );
                    }
                  }
                },
              );
            // return CupertinoTabView(
            //   builder: (context) => QRScanner2(
            //     // uid: "106",
            //     //ส่งค่า uid ไปให้หน้า QRScanner2
            //     uid: userID.toString(),
            //     // code: "01.06.00685",
            //     // uid: "1",
            //   ),
            // );
            // case 2:
            //   // if (userRole == 3) {
            //     return CupertinoTabView(
            //       builder: (context) => POST_BRS(),
            //     );
            // } else {
            //   } else {
            //     // Handle other roles or conditions if needed
            //     // return FutureBuilder(
            //     //     // ... your existing code ...
            //     //     );
            //     // Add a closing brace for the "else" block
            //   }
            // Add a closing brace for the "case 2" block
            case 3:
            default:
              return FutureBuilder(
                future: SharedPerfs().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    var _user = snapshot.data;
                    print("CheckUser");
                    print(_user);
                    final parsedJson = json.decode(_user.toString());
                    print("State Role");
                    print("user_id = " + parsedJson['user_id']);
                    print("role = " + parsedJson['role']);

                    if (parsedJson['role'] == "1") {
                      print("welcome Student Profile Page");
                      return CupertinoTabView(
                        builder: (context) => ProfileScreenST(),
                      );
                    } else if (parsedJson['role'] == "2") {
                      print("welcome Teacher Profile Page");
                      return CupertinoTabView(
                        builder: (context) => ProfileScreenTC(),
                      );
                    } else if (parsedJson['role'] == "3") {
                      print("welcome Admin Profile Page");
                      return CupertinoTabView(
                        builder: (context) => ProfileScreenAD(),
                      );
                    } else {
                      return CupertinoTabView(
                        builder: (context) => ProfileScreen(),
                      );
                    }
                  }
                },
              );
            // Add a closing brace for the "default" case
          }
        },
      );
}
//ถ้า role users เป็น 1 จะให้ไปที่หน้า ProfileScreenST
//ถ้า role users เป็น 2 จะให้ไปที่หน้า ProfileScreenTC
//ถ้า role users เป็น 3 จะให้ไปที่หน้า ProfileScreenAD
