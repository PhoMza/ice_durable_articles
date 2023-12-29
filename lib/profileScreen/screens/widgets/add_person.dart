import 'package:flutter/material.dart';

import 'package:ice_durable_articles/profileScreen/screens/widgets/person_screen.dart';

class AddPersonScreen extends StatelessWidget {
  const AddPersonScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 204, 36, 24),
        title: Text(
          "แก้ไขบุคลากร",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonScreenAD()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "ข้อมูลบุคลากร",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'ฟอร์มเพิ่มบุคลากร',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "username",
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
              "password",
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
              "ชื่อบุคลากร",
              style: TextStyle(
                fontSize: 15,
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
              "ระดับผู้ใช้งาน",
              style: TextStyle(
                fontSize: 15,
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
              "เบอร์โทร",
              style: TextStyle(
                fontSize: 15,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("เพิ่มบุคลากร",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.all(10),
                      fixedSize: Size(
                        175,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("ยกเลิก",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(10),
                    fixedSize: Size(
                      175,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
