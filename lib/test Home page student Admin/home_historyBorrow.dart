import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_historyborrow_model.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/screen/qr_scanner/after_scanqr/qr_details.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/homeAdmin.dart';
import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';

class HistoryUI extends StatefulWidget {
  // final String user_id;
  const HistoryUI({super.key});
  // const HistoryUI({required this.user_id, Key? key}) : super(key: key);

  @override
  State<HistoryUI> createState() => _HistoryUIState();
}

class _HistoryUIState extends State<HistoryUI> {
  late Future<List<Data_borrow>> _getHistoryBorrow;
  late String code;
  late String userID;
  late int userIDJ;

  @override
  void initState() {
    print("in initState");

    checkUser();
    super.initState();
  }

  checkUser() async {
    var user = await SharedPerfs().getUser();
    final parsedJson = json.decode(user.toString());
    setState(() {
      userIDJ = int.parse(parsedJson['user_id']);
      userID = parsedJson['user_id'];
      print("user_id จากหน้า HistoryUI = " + userID.toString());
      print("parsedJson = " + parsedJson.toString());
      getHistoryBorrow_(userID.toString(), "1");
    });

    // สั่งให้ getHistoryBorrow_("1") เป็นการเรียก API หลังจากที่ set state เสร็จสมบูรณ์
    // getHistoryBorrow_("1");
  }

  getHistoryBorrow_(String user_id, String his) async {
    setState(() {
      _getHistoryBorrow = API.get_all_borrow(user_id, his);
      print("get History Borrow จาก getHistoryBorrow_ " + user_id + " " + his);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, ทำให้ icon ย้อนกลับ หายไป
        automaticallyImplyLeading: false,
        // leading: IconButton(
        // onPressed: () {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => ));
        // },
        // icon: const Icon(LineAwesomeIcons.angle_left)),
        centerTitle: true,
        title: Text(
          "ประวัติการยืม",
          style: TextStyle(color: Colors.white, fontSize: tMediumSize),
        ),
        backgroundColor: tRedColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Borrow Page");
                    getHistoryBorrow_(userID.toString(), "1");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(1),
                    onPrimary: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(110, 100),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.person_crop_circle_badge_xmark,
                        color: Colors.white,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          "ยังไม่คืน",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Return Page");
                    getHistoryBorrow_(userID.toString(), "2");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.withOpacity(1),
                    onPrimary: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(110, 100),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.person_crop_circle_badge_checkmark,
                        color: Colors.white,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          "คืนแล้ว",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("ALL Page");
                    getHistoryBorrow_(userID.toString(), "3");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange.withOpacity(1),
                    onPrimary: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(110, 100),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.collections,
                        color: Colors.white,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          "ทั้งหมด",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          Divider(
            height: 20,
          ),
          Expanded(
            // height: 250,
            child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 12),
              child: FutureBuilder(
                  future: _getHistoryBorrow,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("has data");
                      print("data length = ");
                      print(snapshot.data?.length);
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        //itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              snapshot.data![index].status == 'ยังไม่ได้คืน'
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QRdetails(
                                                code: snapshot
                                                    .data![index].qRCode
                                                    .toString(),
                                                uid: userID.toString(),
                                                // code: "1-2555-01.02.05564-1-1-1",
                                                // code2: snapshot
                                                // .data![index].qrCode,
                                                // name: snapshot.data![index].name
                                                //     .toString(),
                                                // room: snapshot.data![index].room
                                                //     .toString(),
                                                // equimentNumber: snapshot
                                                //     .data![index].dNumber
                                                //     .toString(),
                                                // fig: snapshot.data![index].fig
                                                //     .toString(), test
                                              )),
                                    )
                                  : Text("No data");
                            },
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.92,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: snapshot.data![index].status ==
                                          'ยังไม่ได้คืน'
                                      ? Colors.red.withOpacity(0.2)
                                      : snapshot.data![index].status ==
                                              'คืนแล้ว'
                                          ? Colors.green.withOpacity(0.2)
                                          : Colors.orange.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 55.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: Constants.primaryColor
                                                  .withOpacity(.5),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            left: 0,
                                            right: 0,
                                            child: SizedBox(
                                              height: 45.0,
                                              width: 70.0,
                                              child: Image.network(
                                                  'http://kittipong.synology.me:3036/DurableArticles/figs/' +
                                                      snapshot.data![index].fig
                                                          .toString()),
                                              // child: Image.network(
                                              // 'http:kittipong.synology.me:3036/DurableArticles/default_asset_iamge.jpg'),
                                              // snapshot.data![index].fig
                                              // .toString()),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 30,
                                            left: 65,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text(snapshot.data![index].durableName.toString()),
                                                Text(
                                                  snapshot.data![index].name ??
                                                      "No Name",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //BorrowDate & ReturnDate
                                          Positioned(
                                            bottom: 5.0,
                                            left: 65,
                                            child: snapshot
                                                        .data?[index].status ==
                                                    'ยังไม่ได้คืน'
                                                ? Text(
                                                    snapshot.data?[index]
                                                            .borrowDate ??
                                                        "No borrow date",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                : snapshot.data?[index]
                                                            .status ==
                                                        'คืนแล้ว'
                                                    ? Text(
                                                        snapshot.data?[index]
                                                                .returnDate ??
                                                            "No return date",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      )
                                                    : Text(
                                                        "No data",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                          ),
                                          Positioned(
                                            bottom: 5.0,
                                            left: 150,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // TimeBorrow & TimeReturn
                                                snapshot.data?[index].status ==
                                                        'ยังไม่ได้คืน'
                                                    ? Text(
                                                        snapshot.data![index]
                                                                    .timeBorrow
                                                                    .toString() +
                                                                " น." ??
                                                            "No borrow date",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      )
                                                    : snapshot.data?[index]
                                                                .status ==
                                                            'คืนแล้ว'
                                                        ? Text(
                                                            snapshot.data![index]
                                                                        .timeReturn
                                                                        .toString() +
                                                                    " น." ??
                                                                "No return date",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          )
                                                        : Text(
                                                            "No data",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5.0,
                                            left: 230,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // DueDate
                                                // ถ้าเวลาเกินกำหนด  5 ชม จะแสดงเป็นสีแดง

                                                Text(
                                                  snapshot.data![index].duedate
                                                              .toString() +
                                                          " น." ??
                                                      "No status",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5.0,
                                            left: 310,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                snapshot.data?[index].status ==
                                                        'ยังไม่ได้คืน'
                                                    ? IconButton(
                                                        onPressed: () {
                                                          print(index);
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        HomeAdminUI()),
                                                          );
                                                        },
                                                        icon: Icon(
                                                          CupertinoIcons
                                                              .right_chevron,
                                                          color: Colors.black,
                                                          size: 25,
                                                        ),
                                                      )
                                                    : Text(""),

                                                // DueDate
                                                // ถ้าเวลาเกินกำหนด  5 ชม จะแสดงเป็นสีแดง
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.data?.length == null) {
                      print(snapshot.data?.length.toString());
                      return showDataView('คุณไม่มีรายการครุภัณฑ์');
                    } else if (snapshot.hasError) {
                      print(snapshot.hasError.toString());
                      return showDataView(
                          'พบปัญหาในการทำงาน\nกรุณาลองใหม่อีกครั้ง');
                    } else {
                      return loadingView();
                    }
                  }),
            ),
          ),
        ],
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
              valueColor:
                  new AlwaysStoppedAnimation<Color>(Constants.primaryColor),
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          Center(
            child: Text(
              'กำลังประมวลผล...',
              style: TextStyle(
                color: Constants.primaryColor,
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
        style: TextStyle(
            fontSize: 25,
            color: Colors.green[700],
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
