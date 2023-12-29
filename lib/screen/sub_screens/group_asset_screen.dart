import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ice_durable_articles/api_connection/api_service.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/screen/upload_original_image.dart';
// import 'package:ice_durable_kpn/controllers/api_service.dart';
// import 'package:ice_durable_kpn/ui/upload_original_image.dart';

// import '../../../constants.dart';
import '../../../models/each_assetgroup.dart';

class GroupAssetScreen extends StatefulWidget {
  final String year;
  final String roomname;
  final String buding;
  final String durablename;
  final String assetname;
  final String fig;
  final String num;

  GroupAssetScreen(
      {required this.year,
      required this.roomname,
      required this.buding,
      required this.durablename,
      required this.assetname,
      required this.fig,
      required this.num});

  //const GroupAssetScreen({Key? key}) : super(key: key);

  @override
  State<GroupAssetScreen> createState() => _GroupAssetScreenState();
}

class _GroupAssetScreenState extends State<GroupAssetScreen> {
  late Future<List<EachAssetGroup>> _get_each_assetgroup;

  get_each_assetgroup() async {
    setState(() {
      _get_each_assetgroup = ApiService.get_each_assetgroup(
          widget.roomname, widget.durablename, widget.assetname, widget.year);
    });
  }

  @override
  void initState() {
    get_each_assetgroup();
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
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    //padding: EdgeInsets.only(top: 30),
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(30.0),
                      color: Constants.blackColor.withOpacity(.2),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(
                          'http://kittipong.synology.me:3036/DurableArticles/' +
                              widget.fig,
                          fit: BoxFit.contain,
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UploadOriginalImage(
                                      name: widget.assetname);
                                }))
                                  ..then((_) {
                                    setState(() {
                                      //widget.fig = "";
                                    });
                                    get_each_assetgroup();
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
                          widget.assetname,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        widget.durablename != widget.assetname
                            ? Container(
                                child: Text(
                                  widget.durablename,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              )
                            : Container(),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 15.0,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              widget.roomname,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              ', ' + widget.buding,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
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
                        widget.num,
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
                future: _get_each_assetgroup,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: (index % 2) == 0
                              ? EdgeInsets.only(bottom: 15)
                              : EdgeInsets.only(top: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: snapshot.data![index].Status == '1'
                                    ? Colors.white
                                    : snapshot.data![index].Status == '2'
                                        ? Colors.yellow
                                        : snapshot.data![index].Status == '3'
                                            ? Colors.yellow
                                            : snapshot.data![index].Status ==
                                                    '4'
                                                ? Colors.yellow
                                                : snapshot.data![index]
                                                            .Status ==
                                                        '5'
                                                    ? Colors.red
                                                    : Colors.black,
                                //color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  ClipRect(
                                    child: Image.network(
                                      'http://kittipong.synology.me:3036/DurableArticles/' +
                                          snapshot.data![index].Fig,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ListTile(
                                    //leading: Icon(Icons.arrow_drop_down_circle,),
                                    title:
                                        Text(snapshot.data![index].DurableID),
                                    subtitle: Text(
                                      snapshot.data![index].Num +
                                          '/' +
                                          snapshot.data![index].Allnum,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Text(snapshot.data![index].Room)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
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
