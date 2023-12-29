import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/api_connection/api_service.dart';
import 'package:ice_durable_articles/models/year.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ice_durable_articles/screen/constants.dart';
import 'package:ice_durable_articles/screen/sub_screens/room_screen.dart';
import 'package:ice_durable_articles/src/color_strings.dart';


import '../../models/room.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Future<List<AllYear>> _getyear;
  late Future<List<AllRoom>> _getroom;
  int selectedIndex = 99;
  int selectedIndex2 = 0;
  String _year = '';

  //Plants category
  List<String> _plantTypes = [
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2565',
    '2564',
    '2563',
    '2562',
    '2561',
    '2560',
    '2559',
    '2558',
    '2557',
    '2556',
    '2555',
    '2554',
  ];
  //_plantTypes.add('2550');

  getyear() async {
    setState(() {
      _getyear = ApiService.get_allYear();
      //print('finish getyear');
    });
  }

  getroomwithassets() async {
    setState(() {
      _getroom = ApiService.get_roomwithasset(_year);
      //print(widget.year);
    });
  }

  @override
  void initState() {
    getyear();
    getroomwithassets();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: tRedColor,
        centerTitle:  true ,
        title: const Text(
          "Home ",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
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
                        const Expanded(
                            child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),*/

            InkWell(
              onTap: () {
                setState(() {
                  _year = "";
                  selectedIndex = 99;
                  getroomwithassets();
                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 30),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'All',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: _year == "" ? FontWeight.bold : FontWeight.w300,
                    color: _year == ""
                        ? Constants.primaryColor
                        : Constants.blackColor,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50.0,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _plantTypes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                _year = _plantTypes[index];
                                getroomwithassets();
                                //print(selectedIndex);
                                //print(index);
                              });
                            },
                            child: Text(
                              _plantTypes[index],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                                color: selectedIndex == index
                                    ? Constants.primaryColor
                                    : Constants.blackColor,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            /*Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,

              child: FutureBuilder(
                future: _getyear,
                builder: (context, snapshot){
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              selectedIndex = index;
                              _year = _plantTypes[index];
                            },
                            child: Text(
                              //_plantTypes[index],
                              snapshot.data![index].Year,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                                color: selectedIndex == index
                                    ? Constants.primaryColor
                                    : Constants.blackColor,
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),*/
            //RoomWithAssets(year: _year,),

            Container(
              //child: Text(widget.year,),
              height: 260.0,
              child: FutureBuilder(
                future: _getroom,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print('insnap data');
                    //print(snapshot.data?.length);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RoomScreen(
                                year: _year,
                                roomname: snapshot.data![index].Roomname,
                                buding: snapshot.data![index].Buding,
                                Num: snapshot.data![index].NumberOfAssets,
                                Fig: snapshot.data![index].Fig,
                              ),
                            ),
                          ).then((_) {
                            getroomwithassets();
                          }),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: 210.0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Positioned(
                                  bottom: 15.0,
                                  child: Container(
                                    height: 120.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300], //white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${snapshot.data![index].NumberOfAssets} รายการ',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              //fontWeight: FontWeight.w100,//.w600,
                                              //letterSpacing: 1.2,
                                              color: Constants.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Hero(
                                        tag:
                                            '${snapshot.data![index].Roomname}',
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            'http://kittipong.synology.me:3036/DurableArticles/' +
                                                snapshot.data![index].Fig,
                                            height: 180,
                                            width: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data![index].Roomname,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FontAwesomeIcons
                                                      .locationArrow,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.0),
                                                Text(
                                                  snapshot.data![index].Buding,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
          ],
        ),
      ),
    );
  }
}
