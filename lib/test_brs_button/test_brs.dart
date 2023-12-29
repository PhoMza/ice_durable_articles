import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_connection/base_url.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:http/http.dart' as http;
import 'package:ice_durable_articles/api_model/asset_brs.dart';
import 'package:ice_durable_articles/api_model/asset_brs.dart';

class ButtonStatus extends StatefulWidget {
  // final int user_id;
  // final String qr_code;
  // const ButtonStatus({Key? key, required this.user_id, required this.qr_code})
  // : super(key: key);
  const ButtonStatus({super.key});

  @override
  State<ButtonStatus> createState() => BbuttonStateStatus();
}

class BbuttonStateStatus extends State<ButtonStatus> {
  late Future<List<BRSPOST>> _BRS;
  get_brs() async {
    setState(() {
      print("ing get_brs");
      _BRS = API.getAssetBRS("1", "1");
      print("affter ing get_brs");
      print(_BRS);
      // _BRS = API.getAssetBRS(widget.user_id.toString(), widget.qr_code.toString());
    });
  }

  @override
  void initState() {
    print("in init state");
    get_brs();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tRedColor,
        centerTitle: true,
        title: const Text(
          "สถานะการยืม-คืน ",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10, left: 80, right: 80),
        children: [
          MaterialButton(
            color: const Color.fromARGB(255, 204, 36, 24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {},
            child: Text(
              "ยืมครุภัณฑ์",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Color.fromARGB(255, 151, 151, 151),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {},
            child: Text(
              "คืนครุภัณฑ์",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "สถานะครุภัณฑ์",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Text(
                //   "1",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                // Text(
                //   "1",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                // Text(
                //   "1",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                //       Column(),
                //       SizedBox(
                //         width: 10,
                //       ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FutureBuilder(
                future: _BRS,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("has data");
                    print(snapshot.data?.length);

                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Column(
                              children: [
                                Text(snapshot.data![index].borrow.toString()),
                                Text(snapshot.data![index].return1.toString()),
                                Text(snapshot.data![index].status.toString()),
                              ],
                            ),
                          );
                        });
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
          )
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
