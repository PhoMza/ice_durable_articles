import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_durable_articles/screen/qr_scanner/after_scanqr/borrow_screen1.dart';
import 'package:ice_durable_articles/screen/qr_scanner/qr_scanner2.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final String uid;
  final Function() closeScreen;
  const ResultScreen({Key? key, required this.code,required this.uid, required this.closeScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => QRScanner2(uid: uid,)));
            },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 22, 22),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: code,
              size: 150,
              version: QrVersions.auto,
            ),
            const Text(
              "สแกนสำเร็จ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              code,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 160, 22, 22),
                ),
                onPressed: () {
                  // Clipboard.setData(ClipboardData(text: code));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         // fullscreenDialog: true,
                  //         builder: (context) => borrowScreen1()));
                },
                child: Text(
                  "ยืนยัน",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
