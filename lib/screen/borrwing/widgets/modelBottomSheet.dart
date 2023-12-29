import 'package:flutter/material.dart';
import 'package:ice_durable_articles/src/color_strings.dart';

class ModelBottomSheet extends StatelessWidget {
  final String model;
  final Function callbackFunction;
  const ModelBottomSheet(
      {super.key, required this.model, required this.callbackFunction});

  @override
  Widget build(BuildContext context) {
    late String data = model;
    return Container(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: false,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) => StatefulBuilder(
                  builder: (context, state) => Container(
                        constraints: BoxConstraints(
                            minHeight: 100,
                            minWidth: double.infinity,
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.75),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(15.0),
                              topRight: const Radius.circular(15.0),
                            )),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Bottom Sheet",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close_rounded,
                                          size: 30, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text("List Item $index",
                                          style: TextStyle(
                                              color: data == "$index"
                                                  ? Colors.cyan
                                                  : null)),
                                      trailing: data == "$index"
                                  ? Icon(Icons.radio_button_checked_outlined)
                                  : null,
                              iconColor: data == "$index" ? tRedColor : null,
                                      onTap: () {
                                        state(() {
                                          data = "List Item $index";
                                        });
                                        callbackFunction("List Item $index");
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )));
        },
        child: Text(
          "$data",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
