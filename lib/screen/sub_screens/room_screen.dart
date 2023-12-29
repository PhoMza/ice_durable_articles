import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ice_durable_articles/api_connection/api_service.dart';
import 'package:ice_durable_articles/models/assetgroup.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/screen/home/widgets/asset_widget.dart';
import 'package:ice_durable_articles/screen/sub_screens/group_asset_screen.dart';
import 'package:ice_durable_articles/screen/upload_room_image.dart';
// import 'package:ice_durable_kpn/constants.dart';
// import 'package:ice_durable_kpn/controllers/api_service.dart';
// import 'package:ice_durable_kpn/models/assetgroup.dart';
// import 'package:ice_durable_kpn/ui/screens/upload_room_image.dart';
// import 'package:ice_durable_kpn/ui/screens/widgets/asset_widget.dart';
// import 'package:ice_durable_kpn/ui/screens/sub_screens/group_asset_screen.dart';

class RoomScreen extends StatefulWidget {
  final String year;
  final String roomname;
  final String buding;
  final String Num;
  final String Fig;

  RoomScreen(
      {required this.year,
      required this.roomname,
      required this.buding,
      required this.Num,
      required this.Fig      });
  //const RoomScreen({Key? key}) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late Future<List<AssetGroup>> _get_assetgroup;

  get_assetgroup() async {
    setState(() {
      _get_assetgroup = ApiService.get_assetgroup(widget.year, widget.roomname);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(30.0),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: widget.roomname,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(
                          'http://kittipong.synology.me:3036/DurableArticles/'+widget.Fig,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit),
                              iconSize: 30.0,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context){
                                      return UploadRoomImage(Roomname: widget.roomname);
                                    })
                                )..then((_) {
                                  get_assetgroup;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    bottom: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.roomname,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 15.0,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              widget.buding,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    bottom: 22.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.Num,
                        style: TextStyle(
                            color: Constants.blackColor, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Text(
              'รายการครุภัณฑ์',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.primaryColor),
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
                                    year: widget.year,
                                    roomname: widget.roomname,
                                    buding: widget.buding,
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

