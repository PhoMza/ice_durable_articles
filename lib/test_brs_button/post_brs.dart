import 'dart:convert';
import 'dart:developer';
// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_connection/api_service.dart';
import 'package:ice_durable_articles/api_connection/base_url.dart';
import 'package:ice_durable_articles/api_model/asset_brs.dart';

class POST_BRS extends StatefulWidget {
  const POST_BRS({super.key});

  @override
  State<POST_BRS> createState() => _POST_BRSState();
}

class _POST_BRSState extends State<POST_BRS> {
  List<BRSPOST> BRSPOST_ = [];
  // late Future<List> _getBRS;
  late Future<List<BRSPOST>> _getBRS;

  getBRS1() async {
    setState(() {
      // print("CALL BRS");
      _getBRS = getBRS("1", "1");

      print("CALL BRS");
    });
  }

  // get_assetgroup() async {
  //   setState(() {
  //     print(widget.code);
  //     _get_assetgroup = ApiService.get_assetgroup_search(widget.code.toString());
  //   });
  // }

  @override
  void initState() {
    print("in init state");
    print(getBRS1());
    _getBRS = getBRS("1", "1");
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getBRS,
        // print(getBRS("1","1"));
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("has data ");
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height: 300,
                    // color: Colors.white,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "สถานะครุภัณฑ์ : ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Text(
                              snapshot.data![index].status == "1"
                                  ? "ว่าง"
                                  : "ไม่ว่าง",
                              style: TextStyle(
                                  color: snapshot.data![index].status == "1"
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Divider(),
                        // ปุ่ม ยืมครุภัณฑ์
                        ElevatedButton(
                          onPressed: snapshot.data![index].borrow == "0"
                              ? null
                              : () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("ยืมครุภัณฑ์ สำเร็จ"),
                                          ));
                                  print('Button pressed!');
                                },
                          style: ElevatedButton.styleFrom(
                            primary: snapshot.data![index].borrow == "0"
                                ? Color.fromARGB(255, 200, 200,
                                    200) // Lighter color for disabled state
                                : snapshot.data![index].borrow == "1"
                                    ? Color.fromARGB(255, 42, 238, 8)
                                    : Color.fromARGB(255, 204, 36, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            "ยืมครุภัณฑ์",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Divider(),
                        ElevatedButton(
                          onPressed: snapshot.data![index].return1 == "0"
                              ? null
                              : () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("คืนครุภัณฑ์ สำเร็จ"),
                                          ));
                                  print('Button pressed!');
                                },
                          style: ElevatedButton.styleFrom(
                            primary: snapshot.data![index].return1 == "0"
                                ? Color.fromARGB(255, 200, 200,
                                    200) // Lighter color for disabled state
                                : snapshot.data![index].return1 == "1"
                                    ? Color.fromARGB(255, 42, 238, 8)
                                    : Color.fromARGB(255, 204, 36, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            "คืนครุภัณฑ์",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        // MaterialButton(
                        //   color: snapshot.data![index].borrow == "1"
                        //       ? Color.fromARGB(255, 42, 238, 8)
                        //       : Color.fromARGB(255, 204, 36, 24),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(15)),
                        //   // onPressed: () {
                        //   onPressed: snapshot.data![index].borrow == "0"
                        //       ? null // Disable the button if status is 1
                        //       : () {
                        //           // POP ข้อความออกมา
                        //           showDialog(
                        //               context: context,
                        //               builder: (context) => AlertDialog(
                        //                     title: Text("ยืมครุถัณฑ์ สำเร็จ"),
                        //                   ));
                        //           // MaterialPageRoute(
                        //           //     builder: (context) => POST_BRS());
                        //         },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(12.0),
                        //     child: Text(
                        //       "ยืมครุภัณฑ์",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 20,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Divider(),
                        // MaterialButton(
                        //   color: snapshot.data![index].return1 == "1"
                        //       ? Color.fromARGB(255, 42, 238, 8)
                        //       : Color.fromARGB(255, 204, 36, 24),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(15)),
                        //   // onPressed: () {
                        //   onPressed: snapshot.data![index].return1 == "0"
                        //       ? null // Disable the button if status is 1
                        //       : () {
                        //           // POP ข้อความออกมา
                        //           showDialog(
                        //               context: context,
                        //               builder: (context) => AlertDialog(
                        //                     title: Text("คืนครุภัณฑ์ สำเร็จ"),
                        //                   ));
                        //           // MaterialPageRoute(
                        //           //     builder: (context) => POST_BRS());
                        //         },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(12.0),
                        //     child: Text(
                        //       "คืนครุภัณฑ์",
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 20,
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // Text(
                        //   snapshot.data![index].return1 == "1"
                        //       ? "ว่าง"
                        //       : "ไม่ว่าง",
                        //   style: TextStyle(
                        //       color: snapshot.data![index].return1 == "1"
                        //           ? Colors.green
                        //           : Colors.red,
                        //       fontSize: 18),
                        // ),
                        // Text(
                        //   snapshot.data![index].status,
                        //   style: TextStyle(fontSize: 18),
                        // ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<BRSPOST>> getBRS(String user_id, String qr_code) async {
    final response = await http.get(
        // Uri.parse('http://kittipong.synology.me:3036/BeeSom/Tborrow.php?user_id&&qr_code'));
        // Uri.parse('http://kittipong.synology.me:3036/BeeSom/Tborrow_copy.php'));
        // Uri.parse(API.serviceUrlHTTP+'/BeeSom/Tborrow.php?user_id&&qr_code'));
        Uri.parse(API.base_url + '/Tborrow.php?user_id&&qr_code'));

    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<BRSPOST>((json) {
        return BRSPOST.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  // if (response.statusCode == 200) {
  //   print("in 200");
  //   {

  //     // for(Map)
  // BRSPOST_.add(BRSPOST(borrow: "1", return1: "5", status: "3"));

  //     // for (Map<String, dynamic> index in data) {
  //     //   BRSPOST_.add(BRSPOST.fromJson(index)
  //     //   );
  //     // }

  //     // BRSPOST_ = (json.decode(response.body) as List)
  //     //   .map((data) => BRSPOST.fromJson(data))
  //     //   .toList();

  //     print("After from");
  //     print(data);

  //     return BRSPOST_;
  //   }
  // } else {
  //   return BRSPOST_;
  // }
}
