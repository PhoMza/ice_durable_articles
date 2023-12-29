import 'package:flutter/material.dart';
import 'package:ice_durable_articles/screen/constants.dart';
// import '../../../constants.dart';

class EachAssetIngroupWidget extends StatelessWidget {
  String ID;
  String Num;
  String Total;
  String Fig;
  String Status;
  String QR_ID;
  String room;
  String Year;

  EachAssetIngroupWidget({required this.ID, required this.Num, required this.Total, required this.Fig, required this.Status, required this.QR_ID, required this.room, required this.Year});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.2),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),

      ),
      height: 150,
      width: 120,
      //padding: const EdgeInsets.only(left: 10, top: 10),
      //margin: const EdgeInsets.only(bottom: 10, top: 10,left: 10,right: 10),

      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 90,
              child: ClipRRect(

                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                child: Image.network(
                  'http://kittipong.synology.me:3036/DurableArticles/roomfigs/28301.jpg',
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              ID+'/'+Year,
            ),
            //Text('2564'),
            Text(
              Num+'/'+Total,
            )
            

          ],
        ),
      ),
    );

  }
}
