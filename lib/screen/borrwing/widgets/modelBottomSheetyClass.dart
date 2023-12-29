import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';

class ModelBottomSheetClass extends StatelessWidget {
  final _listViewClass = [
    'ปี : 1',
    'ปี : 2',
    'ปี : 3',
    'ปี : 4',
  ];
  final String model;
  final Function callbackFuntion;
  ModelBottomSheetClass({
    super.key,
    required this.model,
    required this.callbackFuntion,
  });
  // get _listViewYear => null;

  @override
  Widget build(BuildContext context) {
    late String data = model;
    return Container(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            backgroundColor: tGreyBackground,
            builder: (BuildContext context) => StatefulBuilder(
              builder: (context, State) => Container(
                constraints: BoxConstraints(
                    minHeight: 100,
                    minWidth: double.infinity,
                    maxHeight: MediaQuery.of(context).size.height * 0.8),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    )),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "เลือก ชั้นปี",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          //item
                          itemCount: _listViewClass.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              // title: Text(europeanCountries[index],
                              title: Text(
                                _listViewClass[index],
                                // "ปี $index",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: data == "$index" ? tRedColor : null,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: data == "$index"
                                  ? Icon(Icons.radio_button_checked_outlined)
                                  : null,
                              iconColor: data == "$index" ? tRedColor : null,
                              onTap: () {
                                State(
                                  () {
                                    switch (_listViewClass.length) {
                                      case 0:
                                        tsheetValueClass = " $index";
                                    }
                                    // data == "$index";
                                  },
                                );
                                callbackFuntion("$index");
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Text(
          "$data",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
