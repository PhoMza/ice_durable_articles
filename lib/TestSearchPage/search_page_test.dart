import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_model/asset_group.dart';
import 'package:ice_durable_articles/TestSearchPage/asset_group_widget.dart';
import 'package:ice_durable_articles/api_connection/api_connection.dart';
import 'package:ice_durable_articles/api_model/asset_qrSearch.dart';
import 'package:ice_durable_articles/screen/home/widgets/asset_widget.dart';
import 'package:ice_durable_articles/screen/sub_screens/group_asset_screen.dart';
import 'package:ice_durable_articles/src/color_strings.dart';

class SearchPageScreen1 extends StatefulWidget {
  const SearchPageScreen1({Key? key}) : super(key: key);

  @override
  State<SearchPageScreen1> createState() => _SearchPageScreen1State();
}

class _SearchPageScreen1State extends State<SearchPageScreen1> {
  late Future<List<QRSearch>> _get_assetgroup;
  TextEditingController keyword = TextEditingController();

  get_assetgroup() async {
    setState(() {
      _get_assetgroup = API.getAssetQRSearch(keyword.text.toString());
    });
  }

  @override
  void initState() {
    get_assetgroup();
    super.initState();
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

  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติการยืม'),
        backgroundColor: tRedColor,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(.6),
                      ),
                      Expanded(
                        child: TextField(
                          controller: keyword,
                          showCursor: true,
                          decoration: InputDecoration(
                            hintText: 'ค้นหา',
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.6),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          keyword.text = "";
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    get_assetgroup();
                  },
                  child: Text(
                    'ค้นหา',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: tRedColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FutureBuilder(
                future: _get_assetgroup,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        scrollDirection: Axis.vertical,
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
                            child: Column(
                              children: [
                                // AssetWidget1(
                                  // Name: snapshot.data![index].Name,
                                  // DurableName:
                                  //     snapshot.data![index].DurableName,
                                  // Fig: snapshot.data![index].Fig,
                                  // Total: snapshot.data![index].Total,

                                // ),
                                // Divider(),
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
}
