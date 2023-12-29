import 'package:flutter/material.dart';
import 'package:ice_durable_articles/screen/constants.dart';

// import '../../../constants.dart';

class AssetWidget2 extends StatelessWidget {
  String DurableName;
  String Name;
  String Total;
  String Fig;

  AssetWidget2(
      {required this.DurableName,
      required this.Name,
      required this.Total,
      required this.Fig});

  //const AssetWidget({Key? key,required this.DurableName, required this.Name, required this.Total, required this.Fig}) : super(key: key);

  //RoomScreen({required this.year,required this.roomname,required this.buding, required this.Num});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 5.0, 5.0, 5.0),
          height: 120.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      child: Text(
                        Name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          Total,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'รายการ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  DurableName,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
                //_buildRatingStars(activity.rating),
                

              ],
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 10.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              'http://kittipong.synology.me:3036/DurableArticles/' + Fig,
              //fit: BoxFit.cover,
              width: 110,
            ),
          ),
        ),
      ],
    );
  }
}
