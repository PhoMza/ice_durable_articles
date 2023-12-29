import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';



class UploadRoomImage extends StatefulWidget {
  String Roomname;
  UploadRoomImage({required this.Roomname});
  //const UploadRoomImage({Key? key}) : super(key: key);

  @override
  State<UploadRoomImage> createState() => _UploadRoomImageState();
}

class _UploadRoomImageState extends State<UploadRoomImage> {
  final ImagePicker _picker = ImagePicker();
  File? uploadimage;

  Future<void> chooseImage() async {
    //var chooseimage = await _picker.pickImage(source: ImageSource.gallery);
    var chooseimage = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 1000.0, maxHeight: 1000.0);
    setState(() {
      uploadimage = File(chooseimage!.path);
    });
  }
  Future<void> cameraImage() async {
    //var chooseimage = await _picker.pickImage(source: ImageSource.gallery);
    var chooseimage = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 1000.0, maxHeight: 1000.0);
    setState(() {
      uploadimage = File(chooseimage!.path);
    });
  }


  Future<void> upLoadData() async {
    //var uploadurl = Uri.parse('192.168.64.2/birddata.php');
    //print(widget.id);
    //print(widget.qr);
    var uploadurl = Uri.parse('http://kittipong.synology.me:3036/DurableArticles/uploadroomimage_kpn.php');
    try {
      List<int> imageBytes = uploadimage!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      var response = await http.post(uploadurl, body: {
        "image": baseimage,
        "description": widget.Roomname,
        "Roomname": widget.Roomname,
      });
      //print(response.body.toString());
      if (response.statusCode == 200) {
        //print("in check code 200");
        var jsondata = json.decode(response.body);

        if (jsondata["error"]) {
          print(jsondata["msg"]);
        } else {
          print('Upload Successful');
          Navigator.pop(context);
        }
      } else {
        print("Error during connection to server" +
            response.statusCode.toString());
      }
    } catch (e) {
      print("Error during converting to Base64" + e.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('อัพโหลดภาพห้อง'),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: uploadimage == null
                    ? SizedBox(
                  child: null
                )
                    : SizedBox(
                  child: Image.file(uploadimage!),height: 300,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    chooseImage();
                  },
                  child: Text('Choose image')),
              ElevatedButton(
                  onPressed: () {
                    cameraImage();
                  },
                  child: Text('Take new image')),
              Container(
                child: uploadimage == null
                    ? Container()
                    : ElevatedButton(
                    onPressed: () {
                      upLoadData();
                    },
                    child: Text('UPLOAD Image')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
