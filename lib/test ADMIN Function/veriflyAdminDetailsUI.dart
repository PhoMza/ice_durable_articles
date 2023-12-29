import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_veriflyDetails.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:http/http.dart' as http;

class VeriflyAdminDetailsUI extends StatefulWidget {
  final String borrow_id;
  const VeriflyAdminDetailsUI({Key? key, required this.borrow_id})
      : super(key: key);

  @override
  State<VeriflyAdminDetailsUI> createState() => _VeriflyAdminDetailsUIState();
}

class _VeriflyAdminDetailsUIState extends State<VeriflyAdminDetailsUI> {
  bool isCheckedNormal = false;
  bool isCheckedProblem = false;
  final TextEditingController _noteController = TextEditingController();

  late Future<List<VeriflyDetails>> _get_assetVeriflyDetails;

  final TextInputType keyboardTypeText = TextInputType.text;

  get_assetVeriflyDetails() async {
    setState(() {
      _get_assetVeriflyDetails = API.getAssetVeriflyDetails(widget.borrow_id);
    });
  }

  @override
  void insertData() async {
    if (isCheckedNormal) {
      var url =
          Uri.http(API.serviceUrl, '/ice_project_borrow/update_status.php');
      final response = await http.post(url, body: {
        "borrow_id": widget.borrow_id,
        "status": "1",
        "detel": _noteController.text,
      });

      // ทำการ insert ข้อมูลลงในตาราง
      // เช่นเรียกใช้ฟังก์ชัน insertToDatabase() หรือทำการส่ง request ไปยัง API
      print('Inserting data...');
    } else if (isCheckedProblem) {
      var url =
          Uri.http(API.serviceUrl, '/ice_project_borrow/update_status.php');
      final response = await http.post(url, body: {
        "borrow_id": widget.borrow_id,
        "status": "2",
        "detel": _noteController.text,
      });

      // ทำการ insert ข้อมูลลงในตาราง
      // เช่นเรียกใช้ฟังก์ชัน insertToDatabase() หรือทำการส่ง request ไปยัง API
      print('Inserting data...');
    } else {
      print('Please select checkbox');
    }
  }

  void initState() {
    super.initState();
    get_assetVeriflyDetails();
  }

  Widget build(BuildContext context) {
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    // return GestureDetector(
    // onTap: () {
    // FocusScope.of(context).unfocus();
    // unfocus textfield
    // },
    // child:
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "รายละเอียด",
          style: TextStyle(color: Colors.white, fontSize: tMediumSize),
        ),
        backgroundColor: tRedColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              child: FutureBuilder(
                future: _get_assetVeriflyDetails,
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
                                  height: 300,
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
                                top: 50,
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
                                          snapshot.data![index].userId
                                              .toString(),
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
                                          snapshot.data![index].username
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
                              Positioned(
                                top: 120,
                                left: 15,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].name
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
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
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "เลขครุภัณฑ์ : " +
                                                  snapshot.data![index].dNumber
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "วันเวลายืม : " +
                                                  snapshot
                                                      .data![index].borrowDate
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].timeBorrow
                                                      .toString() +
                                                  " น.",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "วันเวลาคืน : " +
                                                  snapshot
                                                      .data![index].returnDate
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].timeReturn
                                                      .toString() +
                                                  " น.",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "กำหนดการคืน : " +
                                                  snapshot.data![index].duedate
                                                      .toString() +
                                                  " น.",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.92,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "ตรวจสอบครุภัณฑ์",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
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
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.92,
            //   child: Padding(
            //     padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Text(
            //           "ตรวจสอบครุภัณฑ์",
            //           style:
            //               TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              height: 350,
              child: Column(children: [
                // if (!isKeyboard)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.92,
                        // width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            shape: CircleBorder(),
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => isCheckedNormal
                                    ? Colors.green
                                    : Colors.transparent),
                            value: isCheckedNormal,
                            onChanged: (bool? value) {
                              setState(() {
                                print("ปกติ isCheckedNormal =");
                                isCheckedNormal = value!;
                                //ส่งค่า 1 ไป API ว่า ปกติ

                                // isCheckedNormal = "1"
                                // Uncheck the other checkbox if this one is checked
                                if (isCheckedNormal) {
                                  isCheckedProblem = false;
                                }
                              });
                            },
                          ),
                          Text(
                            "ปกติ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Checkbox(
                            shape: CircleBorder(),
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => isCheckedProblem
                                    ? Colors.green
                                    : Colors.transparent),
                            value: isCheckedProblem,
                            onChanged: (bool? value) {
                              setState(() {
                                print("มีปัญหา isCheckedProblem =");
                                //ส่งค่า 1 ไป API ว่า มีปัญหา

                                // isCheckedProblem = "2"

                                isCheckedProblem = value!;
                                // Uncheck the other checkbox if this one is checked
                                if (isCheckedProblem) {
                                  isCheckedNormal = false;
                                }
                              });
                            },
                          ),
                          Text(
                            "มีปัญหา",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 30,
                      child: Text("หมายเหตุ :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    // if (!isKeyboard)
                    Positioned(
                      top: 130,
                      left: 10,
                      child: Container(
                        // alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.92,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Container(
                            child:
                                //       TextFormField(
                                //   controller: controller.emailController,
                                //   keyboardType: keyboardTypeEmail,
                                //   decoration: InputDecoration(
                                //     border: InputBorder.none,
                                //     labelText: 'อีเมล',
                                //     hintStyle: TextStyle(
                                //       color: Color.fromARGB(255, 72, 70, 70),
                                //     ),
                                //     icon: Icon(
                                //       Icons.person,
                                //       color: Color.fromARGB(255, 72, 70, 70),
                                //     ),
                                //   ),
                                // ),

                                TextFormField(
                              focusNode: FocusNode(),
                              keyboardType: keyboardTypeText,
                              controller: _noteController,
                              decoration: InputDecoration(
                                hintText: "กรุณากรอกหมายเหตุ",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                alignLabelWithHint: true,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      left: 125,
                      child: ElevatedButton(
                        onPressed: () {
                          insertData();
                          //การเพิ่มข้อมูลลงในตาราง
                          // update status และ detel ในตาราง ice_project_borrow
                          Fluttertoast.showToast(
                              msg: "บันทึกข้อมูลสำเร็จ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                           Navigator.pop(context); //คือการ pop ย้อนกลับไปยังหน้าที่มาแล้ว
                        },
                        child: Text(
                          "บันทึก",
                          style: TextStyle(fontSize: 30),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
    // );
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
}
