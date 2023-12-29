import 'package:flutter/material.dart';
import 'package:ice_durable_articles/screen/qr_scanner/qr_scanner2.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class borrowScreen1 extends StatelessWidget {
  final String code;
  final String uid;
  final Function() closeScreen;
  const borrowScreen1(
      {Key? key,
      required this.code,
      required this.uid,
      required this.closeScreen})
      : super(key: key);

  // const borrowScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => QRScanner2(uid: uid,)));
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        centerTitle: true,
        title: Text(
          "กรอกข้อมูล ยืมครุภัฑณ์",
          style: TextStyle(color: Colors.white, fontSize: tMediumSize),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 22, 22),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isKeyboard)
                  Text(
                    code,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      letterSpacing: 1,
                    ),
                  ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: code,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "ชื่อ-นามสกุล",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    //labelText: "ชื่อวิชา",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "เหตุผลการยืม",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    //labelText: "อาจารย์ผู้สอน",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          color: const Color.fromARGB(255, 204, 36, 24),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("บันทึกสำเร็จ"),
                                    ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "ยืมครุภัณท์",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   "หมายเหตุ ห้ามนักศึกษาใช้เกิน 5 ชั่วโมง",
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
