import 'package:flutter/material.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Admin.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
// import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreenAD()));
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        centerTitle: true,
        title: Text(
          "เพิ่มครุภัณฑ์",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: tRedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "ชื่อครุภัณฑ์",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "รหัสครุภัณฑ์",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "ห้องที่จัดเก็บครุภัณฑ์",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "วัน เดือน ปี ที่นำเข้า",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "ครุภัณฑ์ที่ใช้งานได้ปกติไหม?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 175),
              child: Center(
                child: ElevatedButton(
                  child: Text('เพิ่มครุภัณฑ์'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    fixedSize: Size(
                      175,
                      50,
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    primary: Color.fromARGB(255, 204, 36, 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
