import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_veriflyAllAdmin.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/followAdmin.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/veriflyAdminDetailsUI.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/veriflyRepairAdminUI.dart';

class VeriflyAdmin extends StatefulWidget {
  const VeriflyAdmin({super.key});

  @override
  State<VeriflyAdmin> createState() => _VeriflyAdminState();
}

class _VeriflyAdminState extends State<VeriflyAdmin> {
  late Future<List<VeriflyAllAdmin>> _getVeriflyAllAdmin;

  getVeriflyAllAdmin(String verifly) async {
    setState(() {
      _getVeriflyAllAdmin = API.getVeriflyAllAdmin(verifly);
      print("getVeriflyAllAdmin verifly = " + verifly);

      // _getHistoryBorrow = API.getHistoryBorrow(uid.toString(), status);
    });
  }

  @override
  void initState() {
    print("in initState");

    getVeriflyAllAdmin("0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ตรวจสอบครุภัณฑ์",
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
                    getVeriflyAllAdmin("0");
                    print("รอตรวจสอบ page");
                    // getHistoryBorrow_(userID.toString(), "1");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(1),
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
                        CupertinoIcons.arrow_2_circlepath,
                        color: Colors.white,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          "รอตรวจสอบ",
                          style: TextStyle(
                            fontSize: 15,
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
                    getVeriflyAllAdmin("1");
                    print("ตรวจสอบแล้ว Page");
                    // getHistoryBorrow_(userID.toString(), "2");
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
                        CupertinoIcons.check_mark_circled,
                        color: Colors.white,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          "ตรวจสอบแล้ว",
                          style: TextStyle(
                            fontSize: 15,
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
                    getVeriflyAllAdmin("2");
                    print("ซ่อมแซม Page");
                    // getHistoryBorrow_(userID.toString(), "3");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.withOpacity(1),
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
                        CupertinoIcons.wrench,
                        color: Colors.white,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          "ซ่อมแซม",
                          style: TextStyle(
                            fontSize: 15,
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
          Divider(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 12),
              child: FutureBuilder(
                  future: _getVeriflyAllAdmin,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("has data");
                      print("data length = ");
                      // print(snapshot.data?.length);
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        //itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              snapshot.data![index].status == 'รอตรวจสอบ'
                                  ?
                                  // Get.to(() => VeriflyAdminDetailsUI(
                                  //       borrow_id: snapshot
                                  //           .data![index].borrowId
                                  //           .toString(),
                                  //       // borrow_id: "209",
                                  //     ))
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VeriflyAdminDetailsUI(
                                          borrow_id: snapshot
                                              .data![index].borrowId
                                              .toString(),
                                          // borrow_id: "209",
                                        ),
                                      ),
                                    )
                                  : snapshot.data![index].status == 'ชำรุด'
                                      ?
                                      //Get.to(() => VeriflyRepairAdminUI(
                                      //           borrow_id: snapshot
                                      //               .data![index].borrowId
                                      //               .toString(),
                                      //         ))
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VeriflyRepairAdminUI(
                                                    borrow_id: snapshot
                                                        .data![index].borrowId
                                                        .toString(),
                                                    // borrow_id: "209",
                                                  )),
                                        )
                                      : Text("no data");
                            },
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.92,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: snapshot.data![index].status ==
                                          'รอตรวจสอบ'
                                      ? Colors.orange.withOpacity(0.2)
                                      : snapshot.data![index].status == 'ปกติ'
                                          ? Colors.green.withOpacity(0.2)
                                          : Colors.red.withOpacity(0.2),
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
                                                  snapshot.data![index]
                                                          .userId ??
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
                                              child: Text(
                                                snapshot.data?[index].name ??
                                                    "No  name ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              )),
                                          Positioned(
                                            bottom: 30,
                                            left: 180,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "ห้อง : " +
                                                      snapshot.data![index].room
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Positioned(
                                          //   bottom: 5.0,
                                          //   left: 230,
                                          //   child: Column(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       // DueDate
                                          //       // ถ้าเวลาเกินกำหนด  5 ชม จะแสดงเป็นสีแดง

                                          //       Text(
                                          //         snapshot.data![index].duedate
                                          //                     .toString() +
                                          //                 " น." ??
                                          //             "No status",
                                          //         style: TextStyle(
                                          //           fontSize: 16,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          Positioned(
                                            bottom: 5.0,
                                            left: 310,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                snapshot.data?[index].status ==
                                                        'รอตรวจสอบ'
                                                    ? IconButton(
                                                        onPressed: () {
                                                          print(index);
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => VeriflyAdminDetailsUI(
                                                                    borrow_id: snapshot
                                                                        .data![
                                                                            index]
                                                                        .borrowId
                                                                        .toString())),
                                                          );
                                                        },
                                                        icon: Icon(
                                                          CupertinoIcons
                                                              .right_chevron,
                                                          color: Colors.black,
                                                          size: 25,
                                                        ),
                                                      )
                                                    : snapshot.data?[index]
                                                                .status ==
                                                            "ชำรุด"
                                                        ? IconButton(
                                                            onPressed: () {
                                                              print(index);
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => VeriflyRepairAdminUI(
                                                                        borrow_id: snapshot
                                                                            .data![index]
                                                                            .borrowId
                                                                            .toString())),
                                                              );
                                                            },
                                                            icon: Icon(
                                                              CupertinoIcons
                                                                  .right_chevron,
                                                              color:
                                                                  Colors.black,
                                                              size: 25,
                                                            ),
                                                          )
                                                        : Text(""),
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
                    } else if (snapshot.data == null) {
                      return showDataView(
                          'ไม่มีรายการครุภัณฑ์\nที่ต้องตรวจสอบ');
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
        style: TextStyle(fontSize: 20, color: Colors.green[700]),
      ),
    );
  }
}
