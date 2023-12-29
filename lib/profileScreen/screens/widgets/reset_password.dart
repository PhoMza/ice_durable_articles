import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Admin.dart';
// import 'package:ice_durable_articles/features/core/screens/profile/update_profile_screen.dart';
// import 'package:ice_durable_articles/features/core/screens/profile/update_profile_screen.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
// import 'package:ice_durable_articles/src/image_strings.dart';
// import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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
          tEditProfile,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: tRedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "ใส่รหัสผ่านเก่า *",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 50,
              child: TextFormField(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "รหัสผ่านใหม่ *",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 50,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ยืนยัน รหัสผ่าน *",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 50,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
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
                child: Text('ยืนยัน'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  fixedSize: Size(
                    250,
                    70,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(
                    fontSize: 30,
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
