import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_connection/api_service.dart';
import 'package:ice_durable_articles/models/assetgroup.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/screen/home/widgets/asset_widget.dart';
import 'package:ice_durable_articles/screen/sub_screens/group_asset_screen.dart';
// import 'package:ice_durable_kpn/constants.dart';
// import 'package:ice_durable_kpn/models/assetgroup.dart';
// import 'package:ice_durable_kpn/ui/screens/sub_screens/group_asset_screen.dart';
// import 'package:ice_durable_kpn/models/assetgroup.dart';
// import 'package:ice_durable_kpn/ui/screens/widgets/asset_widget.dart';

// import '../../controllers/api_service.dart';



class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  late Future<List<AssetGroup>> _get_assetgroup;
  //TextEditingController name = TextEditingController();
  TextEditingController keyword = TextEditingController();
  //String _keysearch = "";

  get_assetgroup() async {
    setState(() {
      _get_assetgroup = ApiService.get_assetgroup_search(keyword.text.toString());
    });
  }

  @override
  void initState() {
    get_assetgroup();
    super.initState();
  }

  //void popState(){
  //  get_assetgroup();
  //}

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

  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .75,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      Expanded(
                          child: TextField(
                            controller: keyword,
                            showCursor: true,
                            decoration: InputDecoration(
                              hintText: 'Search ',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,

                            ),
                          ),


                      ),
                      InkWell(
                        onTap: (){
                          keyword.text = "";
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    get_assetgroup();
                    print(keyword.text.toString());
                  },
                  child: Text('Search',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.primaryColor,
                      fontSize: 15
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
                    //print('insnap data');
                    //print(snapshot.data?.length);
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => GroupAssetScreen(
                                    year: '',
                                    roomname: '',
                                    buding: '',
                                    durablename:
                                    snapshot.data![index].DurableName,
                                    assetname: snapshot.data![index].Name,
                                    fig: snapshot.data![index].Fig,
                                    num: snapshot.data![index].Total,
                                  ),
                                ),
                              );
                            },

                            //Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));

                            child: Column(
                              children: [
                                AssetWidget(
                                  Name: snapshot.data![index].Name,
                                  DurableName:
                                  snapshot.data![index].DurableName,
                                  Fig: snapshot.data![index].Fig,
                                  Total: snapshot.data![index].Total,
                                ),
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
