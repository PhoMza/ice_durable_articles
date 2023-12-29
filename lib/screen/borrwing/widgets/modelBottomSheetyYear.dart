import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';

class ModelBottomSheetYear extends StatelessWidget {
  final _listViewYear = [
    'พ.ศ : 2550',
    'พ.ศ : 2551',
    'พ.ศ : 2552',
    'พ.ศ : 2553',
    'พ.ศ : 2554',
    'พ.ศ : 2565',
    'พ.ศ : 2556',
    'พ.ศ : 2557',
    'พ.ศ : 2558',
    'พ.ศ : 2559',
    'พ.ศ : 2560',
    'พ.ศ : 2561',
    'พ.ศ : 2562',
    'พ.ศ : 2563',
    'พ.ศ : 2564',
    'พ.ศ : 2565',
    'พ.ศ : 2566',
  ];
  final String model;
  final Function callbackFuntion;
  ModelBottomSheetYear({
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
                              "เลือกปี พ.ศ ",
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
                          itemCount: _listViewYear.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              // title: Text(europeanCountries[index],
                              title: Text(
                                _listViewYear[index],
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
                                    switch (_listViewYear.length) {
                                      case 0:
                                        tsheetValueYear = "AAA";
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
