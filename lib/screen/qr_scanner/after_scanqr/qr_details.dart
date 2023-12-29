import 'dart:convert';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/TestSearchPage/asset_group_widget.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_connection/api_service.dart';
import 'package:ice_durable_articles/api_model/asset_insertBorrow.dart';
import 'package:ice_durable_articles/api_model/asset_qrSearch.dart';
import 'package:ice_durable_articles/api_model/asset_updateReturn.dart';
import 'package:ice_durable_articles/models/assetgroup.dart';
import 'package:ice_durable_articles/screen/qr_scanner/qr_scanner2.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/api_model/asset_brs.dart';
import 'package:ice_durable_articles/test%20Home%20page%20student%20Admin/home_historyBorrow.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QRdetails extends StatefulWidget {
  final String code;
  final String uid;

  final String equimentNumber;
  final String name;
  final String room;
  final String fig;

  // final String no;
  // final String borrow;
  // final String return1;
  // final String status;
  // final Function() closeScreen;
  // const QRdetails({required this.code, required this.uid, Key? key});
  const QRdetails(
      {required this.code,
      required this.uid,
      required this.equimentNumber,
      required this.name,
      required this.room,
      required this.fig,
      // required this.no,

      Key? key})
      : super(key: key);

  // const QRdetails({required this.code, required this.closeScreen, Key? key})
  //     : super(key: key);

  @override
  State<QRdetails> createState() => _QRdetailsState();
}

class _QRdetailsState extends State<QRdetails> {
  //ประกาศตัวแปรเพื่อรับค่าจาก API
  late Future<List<BRSPOST>> _getBRS;

  late Future<List<QRSearch>> _get_assetQrSearch; // เรียกใช้ model ที่เราสร้าง

  // late Future<List<UpdateReturn>> _getUpdateReturn;

  // late Future<List<InsertBorrow>> _getAssetInsertBorrow;

  get_assetgroup() async {
    setState(() {
      print(widget.code);
      print("QRcode From get_assetgroup = " + widget.code.toString());
      _get_assetQrSearch = API.getAssetQRSearch(widget.code.toString());
      // _getBRS = API.getBRS(widget.borrow.toString(), widget.return1.toString(),
      //     widget.status.toString());
      getBRS();
    });
  }

  getBRS() async {
    setState(() {
      _getBRS = API.getAssetBRS(widget.uid.toString(), widget.code.toString());
      print("userId From QRScanner to QRDetail= " + widget.uid.toString());
      print("code From QRScanner to QRDetails = " + widget.code.toString());

      // getUpdateReturn();
      // _getBRS = API.getAssetBRS(widget.uid.toString(), widget.code.toString());

      // print("_getBRS ฟังก์ชัน"+_getBRS.toString());
    });
  }

  // getUpdateReturn() async {
  //   setState(() {
  //     _getUpdateReturn = API.getAssetUpdateReturn(
  //         widget.uid.toString(), widget.code.toString());
  //     print("userId  Update Return = " + widget.uid.toString());
  //     print("code Update Return = " + widget.code.toString());

  //     // _getBRS = API.getAssetBRS(widget.uid.toString(), widget.code.toString());

  //     // print("_getBRS ฟังก์ชัน"+_getBRS.toString());
  //   });
  // }

  // ปุ่มยืม ต้องการ QR_code user_id name room D_number fig เพื่อทำการเพิ่มข้อมูลการยืม
  //ต้องส่งค่า  QR_code user_id name room D_number fig ให้ กับปุ่มยืม    เพื่อทำการเพิ่มข้อมูลการยืม
  // getInsertBorrow() async {
  //   var url = Uri.http(
  //       'kittipong.synology.me:3036', '/ice_project_borrow/insert_borrow.php');
  //   // var url = Uri.http('192.168.1.102', '/ice_project_borrow/insert_borrow.php');

  //   print("in funtion getAssetBRS");
  //   print(url.toString());

  //   var res = await http.post(url, body: {
  //     'user_id': widget.uid,
  //     'QR_code': widget.code,
  //     'name': widget.name,
  //     'room': widget.room,
  //     'D_number': widget.equimentNumber,
  //     'fig': widget.fig,
  //   });

  //   print(res.statusCode);
  //   if (res.statusCode == 200) {
  //     final response_data = jsonDecode(res.body);

  //     print("success decode = " + response_data.toString());
  //     print("response_200 in getAssetInsertBorrow");
  //     // print("friend = "+friend_data.toString());
  //   }

  //   print("Success = " + res.body.toString());
  //   print("Success = " + res.body.toString());
  // }

  // Insert Borrow ที่ใช้ได้

  Future<bool> borrow() async {
    var url = Uri.http(API.serviceUrl, '/ice_project_borrow/insert_borrow.php');
    final response = await http.post(url, body: {
      'user_id': widget.uid,
      'QR_code': widget.code,
      // 'name': "แป้นพิมพ์5",
      // 'room': "28306",
      // 'D_number': "07.166.0003",
      // 'fig': widget.fig,
      'name': widget.name,
      'room': widget.room,
      'D_number': widget.equimentNumber,
      'fig': widget.fig,
    });
    print(response.body);
    String sec = "0";
    if (response.statusCode == 200) {
      print("friend_data");

      final response_data = jsonDecode(response.body);

      for (var result in response_data) {
        sec = result['Secces'];
        print(result['Secces']);
      }
      if (sec == "1") {
        print("sec = " + sec.toString());
        print("borrow success");
        return true;
      } else {
        print("sec = " + sec.toString());
        print("borrow fail");
        return false;
      }
    } else {
      return false;
    }
  }
  // end Insert Borrow ที่ใช้ได้

  // Insert Borrow ที่ใช้ได้

  Future<bool> UpdateReturn() async {
    var url = Uri.http(API.serviceUrl, '/ice_project_borrow/update_retrun.php');
    print("in function UpdateReturn");
    final response = await http.post(url, body: {
      'user_id': widget.uid,
      'QR_code': widget.code,
      // 'name': widget.name,
      // 'room': widget.room,
      // 'D_number': widget.equimentNumber,
      // 'fig': widget.fig,
    });

    print(response.body);
    print("response.body = " + response.body.toString());
    String sec = "0";
    if (response.statusCode == 200) {
      print("friend_data");

      final response_data = jsonDecode(response.body);

      for (var result in response_data) {
        sec = result['success'];
        print(result['success']);
      }
      if (sec == "1") {
        print("sec = " + sec.toString());
        print("return success");
        return true;
      } else {
        print("sec = " + sec.toString());
        print("return fail");
        return false;
      }
    } else {
      return false;
    }
  }
  // end Insert Borrow ที่ใช้ได้

  @override
  void initState() {
    print("in init state");
    get_assetgroup();
    // getUpdateReturn();
    // getInsertBorrow();
    // getBRS();
    // print(" qrdetails user_id = " + widget.uid.toString());

    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "รายละเอียดครุภัณฑ์",
          style: TextStyle(color: Colors.white, fontSize: tMediumSize),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 22, 22),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: FutureBuilder(
                  // สร้าง FutureBuilder โดยให้มีการ return ค่าจากฟังก์ชัน get_assetgroup
                  future: _get_assetQrSearch,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("has data");
                      print(snapshot.data?.length);

                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          // scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (_) => GroupAssetScreen(
                              //         year: '',
                              //         roomname: '',
                              //         buding: '',
                              //         durablename:
                              //             snapshot.data![index].DurableName,
                              //         assetname: snapshot.data![index].Name,
                              //         fig: snapshot.data![index].Fig,
                              //         num: snapshot.data![index].Total,
                              //       ),
                              //     ),
                              //   );
                              // },

                              child: Container(
                                decoration: BoxDecoration(
                                  color: tRedColor.withOpacity(.09),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 280.0,
                                // color: tRedColor.withOpacity(.05),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                margin: const EdgeInsets.all(.5),
                                // width: size.width,
                                child: Column(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Positioned(
                                      bottom: 5,
                                      left: 0,
                                      right: 0,
                                      child: SizedBox(
                                        height: 150.0,
                                        child: Image.network(
                                            'http://kittipong.synology.me:3036/DurableArticles/figs/' +
                                                snapshot.data![index].fig
                                                    .toString()),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Positioned(
                                      // bottom: 5,
                                      // left: 0,
                                      // right: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            // CrossAxisAlignment.start,
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data![index].name
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Colors.black
                                                // .withOpacity(.7),
                                                ),
                                          ),
                                          // Divider(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            snapshot.data![index].no.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Text(snapshot.data![index].Total),

                                    // AssetWidget1(
                                    //   Name: snapshot.data![index].Name,
                                    //   DurableName:
                                    //       snapshot.data![index].DurableName,
                                    //   Fig: snapshot.data![index].Fig,
                                    //   Total: snapshot.data![index].Total,
                                    //   // uid: widget.uid,
                                    // ),
                                    // // Divider(),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else if (snapshot.data?.length == null) {
                      print(snapshot.data?.length.toString());
                      return showDataView('ไม่พบข้อมูล');
                    } else if (snapshot.hasError) {
                      print(snapshot.hasError.toString());
                      return showDataView(
                          'พบปัญหาในการทำงาน\nกรุณาลองใหม่อีกครั้ง');
                    } else {
                      return loadingView();
                    }
                  },
                ),
              ),
            ),
            // Expanded จองพื้นที่ที่เหลือทั้งหมด
            Container(
              height: 300,
              child: FutureBuilder(
                  future: _getBRS,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("has data");
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "สถานะครุภัณฑ์",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black),
                                      ),
                                      Text(
                                        snapshot.data![index].status == "1"
                                            ? "ว่าง"
                                            : "ไม่ว่าง",
                                        style: TextStyle(
                                            color:
                                                snapshot.data![index].status ==
                                                        "1"
                                                    ? Colors.green
                                                    : Colors.red,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  // ปุ่ม ยืมครุภัณฑ์
                                  ElevatedButton(
                                    onPressed: snapshot.data![index].borrow ==
                                            "0"
                                        ? null
                                        : () async {
                                            if (await borrow()) {
                                              print("insert Compleate");
                                              Navigator.pop(context);
                                              Fluttertoast.showToast(
                                                  msg: "ยืมครุภัณฑ์สำเร็จ",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else {
                                              Fluttertoast.showToast(
                                                msg: "ยืมครุภัณฑ์ ไม่สำเร็จ",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            }
                                            print("Button Borrow pressed!");
                                          },
                                    style: ElevatedButton.styleFrom(
                                      primary: snapshot.data![index].borrow ==
                                              "0"
                                          ? Color.fromARGB(255, 200, 200, 200)
                                          : snapshot.data![index].borrow == "1"
                                              ? Color.fromARGB(255, 42, 238, 8)
                                              : Color.fromARGB(
                                                  255, 204, 36, 24),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 25),
                                    ),
                                    child: Text(
                                      "ยืมครุภัณฑ์",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  //ปุ่ม คืน ครุภัณฑ์
                                  ElevatedButton(
                                    //จาก php ส่ง secces 1 มา แสดงว่า คืนครุภัณฑ์สำเร็จ
                                    //แต่ตอนนี้ เอา API ออกมาไม่ได้
                                    //เพราะติดตรง FutureBuilder ไม่ได้เรียก _getUpdateReturn มาใช้
                                    //ถ้าจะทำให้  seccces มาใส่ได้ ต้องทำให้ _getBRS ส่ง secces มาด้วยหรือไม่
                                    onPressed: snapshot.data![index].return1 ==
                                            "0"
                                        ? null
                                        : () async {
                                            if (await UpdateReturn()) {
                                              print("Update Return Compleate");
                                              Navigator.pop(context);
                                              Fluttertoast.showToast(
                                                  msg: "คืนครุภัณฑ์สำเร็จ",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else {
                                              Fluttertoast.showToast(
                                                msg: "คืนครุภัณฑ์ ไม่สำเร็จ",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            }
                                            print("Button Return pressed!");
                                          },
                                    style: ElevatedButton.styleFrom(
                                      primary: snapshot.data![index].return1 ==
                                              "0"
                                          ? Color.fromARGB(255, 200, 200,
                                              200) // Lighter color for disabled state
                                          : snapshot.data![index].return1 == "1"
                                              ? Color.fromARGB(255, 42, 238, 8)
                                              : Color.fromARGB(
                                                  255, 204, 36, 24),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 25),
                                    ),
                                    child: Text(
                                      "คืนครุภัณฑ์",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 50,
                                  // ),
                                  // Divider(
                                  //   height: 50,
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
                  }),
            ),
            // SizedBox(
            //   height: 200,
            // ),
          ],
        ),
      ),
    );
  }

  Widget loadingView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          Center(
            child: Text(
              'กำลังประมวลผล...',
              style: TextStyle(
                fontSize: 18.0,
                color: const Color.fromARGB(255, 7, 255, 135),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showDataView(String msg) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(fontSize: 20, color: Colors.green[700]),
      ),
    );
  }

  Future<List<BRSPOST>> getBRS2(String user_id, String qr_code) async {
    final response = await http.get(
        //แบบ GET ใน API เป็น POST
        Uri.parse(API.base_url + '/Tborrow.php?user_id&&qr_code'));
// Uri.parse('http://kittipong.synology.me:3036/BeeSom/Tborrow.php?user_id&&qr_code'));
    // Uri.parse('http://kittipong.synology.me:3036/BeeSom/Tborrow_copy.php'));
    // Uri.parse(API.serviceUrlHTTP+'/BeeSom/Tborrow.php?user_id&&qr_code'));

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
}
