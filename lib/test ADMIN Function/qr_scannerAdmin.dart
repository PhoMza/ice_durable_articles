import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_model/asset_group.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_profile.dart';
import 'package:ice_durable_articles/api_model/user.dart';
import 'package:ice_durable_articles/screen/qr_scanner/after_scanqr/qr_details.dart';
import 'package:ice_durable_articles/screen/qr_scanner/qrscanneroverlay.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/historyAdminDetails.dart';
import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerAdmin extends StatefulWidget {
  final String uid;
  const QRScannerAdmin({required this.uid, Key? key}) : super(key: key);

  @override
  State<QRScannerAdmin> createState() => _QRScannerAdminState();
}

class _QRScannerAdminState extends State<QRScannerAdmin> {
// class QRScanner2 extends StatefulWidget {
//   final String uid;
//   const QRScanner2({required this.uid, Key? key}) : super(key: key);

//   @override
//   State<QRScanner2> createState() => QRScanner2State();
// }

// class QRScanner2State extends State<QRScanner2> {
  late int userID;
  late int userRole;

  // final String uid;
  // late Future<List<AssetProfile>> _get_assetuserID;

  checkUser() async {
    var user = await SharedPerfs().getUser();
    final parsedJson = json.decode(user
        .toString()); // ต้องประกาศตัวแปร เพื่อ setstate ให้ userRole รับค่าได้
    setState(() {
      userRole = int.parse(parsedJson[
          'role']); //เรียกใช้ตัวแปร userRole ที่ประกาศไว้ แล้วให้ userRole รับค่าจาก parsedJson['role']
      userID = int.parse(parsedJson['user_id']);
      print("user_id ที่หน้า QRScanner = " + userID.toString());
    });
  }

  // get_assetgroupBorrow() async {
  //   setState(() {
  //     print("get_assetgroupBorrow from QRScanner ");
  //     // print(User(user_id: widget.uid));
  //     print("user_id  from tabbar to QRScanner = " + widget.uid.toString());
  //     _get_assetuserID = API.getAssetProfile(widget.uid.toString());
  //     // print(" user QRScanner = " + _get_assetgroupBorrow.toString());
  //   });
  // }

  MobileScannerController cameraController = MobileScannerController();
  bool screenOpened = false;

  @override
  void initState() {
    print("initState from QRScanner");
    // TODO: implement initState
    this.closeScreen();
    // get_assetgroupBorrow();
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "QR Scanner",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: tMediumSize),
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 160, 22, 22),
      ),
      body: Stack(
        children: [
          MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: foundbarcode),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      ),
    );
  }

  void foundbarcode(Barcode barcode, MobileScannerArguments? arguments) {
    print(barcode);
    if (!screenOpened) {
      final String _codeX = barcode.rawValue.toString();

      // final String _uid = API.getAssetProfile(widget.uid).toString();

      // final _uid = json.decode(_uidX);

      print("code affter read qr code =");
      print(_codeX);
      print("_uid from QRScanner " + userID.toString());
      String _code = _codeX.toString();

      screenOpened = false;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HistoryAdminDetails(
                    
                    // code: _code,

                    code: _code,
                    // code: "01.06.00685",
                    // uid: userID.toString(),

                    //code: "01.06.00685",
                    // get_assetgroup();
                  )));
      //หน้าผลลัพธ์
    }
  }

  void closeScreen() {
    screenOpened = false;
  }
}
