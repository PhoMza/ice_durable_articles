import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => UploadImageState();
}

class UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: Text(
        "อัพโหลดรูปภาพ",
        style: TextStyle(color: Colors.white, fontSize: tMediumSize),
      ),
      backgroundColor: tRedColor,
    ));
  }
}
