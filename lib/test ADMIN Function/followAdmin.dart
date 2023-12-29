import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_followStatusAdmin.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/veriflyAdminDetailsUI.dart';

class FollowStatusUserUI extends StatefulWidget {
  const FollowStatusUserUI({super.key});

  @override
  State<FollowStatusUserUI> createState() => _FollowStatusUserUIState();
}

class _FollowStatusUserUIState extends State<FollowStatusUserUI> {
  late Future<List<FollowStatusAdmin>> _getFollowStatusAdmin;
  late String follow_status;
  late String follow = "0";

  @override
  void initState() {
    getFollowStatusAdmin("0");
    super.initState();
  }

  getFollowStatusAdmin(String follow_status) async {
    setState(() {
      _getFollowStatusAdmin = API.getFollowStatusAdmin(follow_status);
      print("follow_status = " + follow_status.toString());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ติดตามสถานะการใช้งาน",
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Borrow Page");
                    getFollowStatusAdmin("0");
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
                          "บุคคลยังไม่คืน",
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
                    print("AdminReturn Page");
                    getFollowStatusAdmin("1");
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
                          "บุคคลที่คืนแล้ว",
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
          Divider(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 12),
            child: FutureBuilder(
                future: _getFollowStatusAdmin,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("has data");
                    print("data length = ");
                    print(snapshot.data?.length);
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            snapshot.data?[index].status == 'คืนแล้ว'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VeriflyAdminDetailsUI(
                                              borrow_id: snapshot
                                                  .data![index].borrowId
                                                  .toString(),
                                              //ส่ง borrow_id ไปให้ veriflyAdminDetailsUI
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
                                // color: Colors.green.withOpacity(0.2),
                                color: snapshot.data![index].status ==
                                        'ยังไม่ได้คืน'
                                    ? Colors.red.withOpacity(0.2)
                                    : snapshot.data![index].status == 'คืนแล้ว'
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
                                                snapshot.data![index].userId ??
                                                    "No Name",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 30,
                                          left: 180,
                                          child: Text(
                                            "ห้อง : " +
                                                    snapshot.data![index].room
                                                        .toString() ??
                                                "No Name",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5.0,
                                          left: 65,
                                          child: Text(
                                            snapshot.data![index].name ??
                                                "No Name",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
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
                                                      'คืนแล้ว'
                                                  ? IconButton(
                                                      onPressed: () {
                                                        print(index);
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  VeriflyAdminDetailsUI(
                                                                    borrow_id: snapshot
                                                                        .data![
                                                                            index]
                                                                        .borrowId
                                                                        .toString(),
                                                                  )),
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
                    return showDataView('ไม่มีรายการครุภัณฑ์');
                  } else if (snapshot.hasError) {
                    print(snapshot.hasError.toString());
                    return showDataView(
                        'พบปัญหาในการทำงาน\nกรุณาลองใหม่อีกครั้ง');
                  } else {
                    return loadingView();
                  }
                }),
          )),
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
