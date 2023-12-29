import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_qrSearch.dart';
import 'package:ice_durable_articles/api_model/asset_scanAdminDetails.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';

class HistoryAdminDetails extends StatefulWidget {
  final String code;

  const HistoryAdminDetails({required this.code, Key? key}) : super(key: key);

  @override
  State<HistoryAdminDetails> createState() => HistoryAdminDetailsState();
}

class HistoryAdminDetailsState extends State<HistoryAdminDetails> {
  late Future<List<QRSearch>> _get_assetQrSearch;
  late Future<List<ScanAdminDetails>> _get_assetScanAdminDetails;

  get_assetgroup() async {
    setState(() {
      print(widget.code);
      print("QRcode From get_assetgroup = " + widget.code.toString());
      _get_assetQrSearch = API.getAssetQRSearch(widget.code.toString());
      // _getBRS = API.getBRS(widget.borrow.toString(), widget.return1.toString(),
      //     widget.status.toString());
      get_ScanAdminDetails();
    });
  }

  get_ScanAdminDetails() async {
    setState(() {
      print(widget.code);
      print("QRcode From get_assetgroup = " + widget.code.toString());
      _get_assetScanAdminDetails =
          API.getScanAdminDetails(widget.code.toString());
      // _getBRS = API.getBRS(widget.borrow.toString(), widget.return1.toString(),
      //     widget.status.toString());
    });
  }

  @override
  void initState() {
    print("in init state");
    get_assetgroup();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ประวัติการใช้งานครุภัณฑ์",
          style: TextStyle(color: Colors.white, fontSize: tMediumSize),
        ),
        backgroundColor: tRedColor,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 230,
              child: FutureBuilder(
                future: _get_assetQrSearch,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("has data");
                    print("data length = ");
                    print(snapshot.data?.length);
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 20, 10, 0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color:
                                        Constants.primaryColor.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 30,
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Constants.whiteColor.withOpacity(.5),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 35,
                                child: SizedBox(
                                  height: 60.0,
                                  // child: Image.asset(
                                  //   'assets/bee.jpg',
                                  //   // fit: BoxFit.contain,
                                  // )
                                  child: Image.network(
                                      'http://kittipong.synology.me:3036/DurableArticles/figs/' +
                                          snapshot.data![index].fig.toString()),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                // left: 55,
                                left: 150,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "เลขครุภัณฑ์",
                                          // "634659102",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 70,
                                left: 150,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].equipmentNumber
                                              .toString(),
                                          // "634659102",
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 120,
                                left: 35,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].name.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 160,
                                left: 35,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ห้อง : " +
                                              snapshot.data![index].room
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
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
            Divider(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 12),
                child: FutureBuilder(
                    future: _get_assetScanAdminDetails,
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
                              onTap: () {},
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: snapshot.data![index].returnDate ==
                                              'Not Returned'
                                          ? Colors.red.withOpacity(0.2)
                                          : Colors.green.withOpacity(0.2)
                                      //     ? Colors.green.withOpacity(0.2)
                                      //     : Colors.orange.withOpacity(0.2),
                                      // borderRadius: BorderRadius.circular(8),
                                      ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(),
                                            // Positioned(
                                            //   bottom: 5,
                                            //   left: 0,
                                            //   right: 0,
                                            //   child: SizedBox(
                                            //     height: 45.0,
                                            //     width: 70.0,
                                            //     child: Image.network(
                                            //         'http://kittipong.synology.me:3036/DurableArticles/figs/' +
                                            //             snapshot
                                            //                 .data![index].fig
                                            //                 .toString()),
                                            //     // child: Image.network(
                                            //     // 'http:kittipong.synology.me:3036/DurableArticles/default_asset_iamge.jpg'),
                                            //     // snapshot.data![index].fig
                                            //     // .toString()),
                                            //   ),
                                            // ),
                                            Positioned(
                                              top: 5,
                                              left: 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Text(snapshot.data![index].durableName.toString()),
                                                  Text(
                                                    snapshot.data![index]
                                                            .username ??
                                                        "No Name",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              left: 5,
                                              child:
                                                  // snapshot.data?[index]
                                                  //             .status ==
                                                  //         'ยังไม่ได้คืน'
                                                  // ?
                                                  Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "วันที่ยืม : " +
                                                        snapshot.data![index]
                                                            .borrowDate
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "เวลายืม : " +
                                                        snapshot.data![index]
                                                            .timeBorrow
                                                            .toString() +
                                                        " น.",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "เวลาคืน : " +
                                                        snapshot.data![index]
                                                            .timeReturn
                                                            .toString() +
                                                        " น.",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // DueDate
                                            // ถ้าเวลาเกินกำหนด  5 ชม จะแสดงเป็นสีแดง
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
                        return showDataView('ไม่มีประวัติการยืม ครุภัณฑ์');
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

// Stack(
//   clipBehavior: Clip.none,
//   children: [
//     Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
//       child: Container(
//         height: 180,
//         decoration: BoxDecoration(
//           color: Constants.primaryColor.withOpacity(0.4),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(

//         ),
//       ),
//     ),
//     Positioned(
//       top: 65,
//       left: 25,
//       child: Container(
//         width: 75.0,
//         height: 90.0,
//         decoration: BoxDecoration(
//           color: Constants.whiteColor.withOpacity(.5),
//           shape: BoxShape.circle,
//         ),
//       ),
//     ),
//     Positioned(
//       top: 65,
//       left: 25,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.92,
//         child: Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "รูป",
//                 style: TextStyle(
//                     fontSize: 40, fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     Positioned(
//       top: 50,
//       left: 100,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.92,
//         child: Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "เลขครุภัณฑ์ :",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "01.01.00865",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "ชื่อครุภัณฑ์ :",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "ไอแพด",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "ห้อง :",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "28306",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

// SizedBox(
//   height: 10,
// ),
// Container(
//   width: MediaQuery.of(context).size.width * 0.92,
//   child: Text("บุคลากรที่ใช้งานครุภัณฑ์",
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
// ),

//FutureBuilder
