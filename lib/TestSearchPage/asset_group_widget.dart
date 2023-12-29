import 'package:flutter/material.dart';
import 'package:ice_durable_articles/screen/constants.dart';

// import '../../../constants.dart';

class AssetWidget1 extends StatelessWidget {
  String DurableName;
  String Name;
  String Total;
  String Fig;
  // String uid;

  AssetWidget1({
    required this.DurableName,
    required this.Name,
    required this.Total,
    required this.Fig,
  });
  // required this.uid});

  //const AssetWidget({Key? key,required this.DurableName, required this.Name, required this.Total, required this.Fig}) : super(key: key);

  //RoomScreen({required this.year,required this.roomname,required this.buding, required this.Num});
//  widget รายละเอียด ครุภัณฑ์
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.5),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 80.0,
                  child: Image.network(
                      'http://kittipong.synology.me:3036/DurableArticles/' +
                          Fig),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DurableName),
                    Text(
                      Name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              Total,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Constants.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
