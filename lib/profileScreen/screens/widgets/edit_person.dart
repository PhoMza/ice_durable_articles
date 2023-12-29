import 'package:flutter/material.dart';
import 'package:ice_durable_articles/profileScreen/screens/widgets/person_screen.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditPerson extends StatelessWidget {
  const EditPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonScreenAD()));
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        centerTitle: true,
        title: Text(
          tChangePassword,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: tRedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "สร้างรหัสผ่านใหม่",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "username",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(
                  helperText: 'ใส่ username',
                  helperStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(
                  helperText: 'ตั้งรหัสผ่าน ให้เกิน 8 ตัวอักษร',
                  helperStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  helperText: 'ยืนยัน รหัสผ่านอีกครั้ง',
                  helperStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                child: Text('ยืนยันการแก้ไข'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  fixedSize: Size(
                    350,
                    70,
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
          ],
        ),
      ),
    );
  }
}
